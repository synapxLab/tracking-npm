/**
 * 🛰️ @synapxlab/tracking-npm
 * Lightweight usage ping — 1 exécution max par package_key et par page.
 */

export interface TrackingConfig {
  version?: string | null;
  package_key?: string | null;
  DELAY_MS?: number;
  CHANCE?: number; // [0..1]
}

interface InternalConfig {
  version: string | null;
  package_key: string | null;
  DELAY_MS: number;
  CHANCE: number;
}

export const trackingnpm = (() => {
  const npm_config: InternalConfig = {
    version: null,
    package_key: null,
    DELAY_MS: 10_000,
    CHANCE: 0.01,
  };

  let pendingTimeout: ReturnType<typeof setTimeout> | null = null;
  let idleHandle: number | null = null;

  const clamp = (v: number, min = 0, max = 1) => Math.min(max, Math.max(min, v));

  const getRegistry = (): Set<string> => {
    if (typeof window !== 'undefined') {
      (window as any).__TRACKING_NPM_REGISTRY__ ??= new Set<string>();
      return (window as any).__TRACKING_NPM_REGISTRY__;
    }
    return new Set<string>();
  };

  const send = () => {
    if (Math.random() > npm_config.CHANCE) return;
    if (!npm_config.package_key) return;

    const url = 'https://npm.synapx.fr';
    const payload = JSON.stringify(npm_config);

    if (typeof navigator !== 'undefined' && 'sendBeacon' in navigator) {
      try {
        const blob = new Blob([payload], { type: 'application/json' });
        navigator.sendBeacon(url, blob);
        return;
      } catch {
        /* ignore */
      }
    }

    fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: payload,
      keepalive: true,
    }).catch(() => {
      /* silent fail */
    });
  };

  const run = () => {
    const executeTracking = () => send();

    const ric = (window as any).requestIdleCallback as
      | ((cb: (d: { didTimeout: boolean; timeRemaining(): number }) => void, opts?: { timeout?: number }) => number)
      | undefined;

    if (typeof ric === 'function') {
      idleHandle = ric(executeTracking, { timeout: 1_000 });
    } else {
      pendingTimeout = setTimeout(executeTracking, 1_000);
    }
  };

  return {
    /**
     * Initialise le tracking.
     */
    init(conf: TrackingConfig = {}): void {
      if (typeof conf !== 'object') return;
      if (typeof window === 'undefined' || typeof document === 'undefined') return; // SSR skip

      npm_config.version = conf.version ?? npm_config.version;
      npm_config.package_key = conf.package_key ?? npm_config.package_key;

      if (typeof conf.DELAY_MS === 'number' && isFinite(conf.DELAY_MS) && conf.DELAY_MS >= 0) {
        npm_config.DELAY_MS = conf.DELAY_MS;
      }
      if (typeof conf.CHANCE === 'number') {
        npm_config.CHANCE = clamp(conf.CHANCE);
      }

      const registry = getRegistry();
      const packageKey = npm_config.package_key;

      if (packageKey && registry.has(packageKey)) return;
      if (packageKey) registry.add(packageKey);

      const startTracking = () => {
        pendingTimeout = setTimeout(run, npm_config.DELAY_MS);
      };

      if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', startTracking, { once: true });
      } else {
        startTracking();
      }
    },
  };
})();

export default trackingnpm;
