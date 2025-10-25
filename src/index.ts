/**
 * 🛰️ @synapxlab/tracking-npm
 * 
 * Lightweight NPM package usage tracker
 * - 1 call max per library (by package_key)
 * - Waits for DOMContentLoaded
 * - Waits 10s before execution
 * - Executes at idle (or after 1s fallback)
 * - 1% execution probability (configurable)
 * 
 * @see https://synapx.fr/sdk/Tracking_NPM/
 */
export interface TrackingConfig {
  version?: string | null;
  package_key?: string | null;
  DELAY_MS?: number;
  CHANCE?: number;
}

interface InternalConfig {
  version: string | null;
  package_key: string | null;
  DELAY_MS: number;
  CHANCE: number;
}

// 🔒 Registre global des package_key déjà initialisés
declare global {
  interface Window {
    __TRACKING_NPM_REGISTRY__?: Set<string>;
  }
}

export const trackingnpm = (() => {
  const npm_config: InternalConfig = {
    version: null,
    package_key: null,
    DELAY_MS: 10_000,
    CHANCE: 0.01
  };

  const ctrl = new AbortController();
  const signal = ctrl.signal;
  let pendingTimeout: number | null = null;

  /**
   * Get or create the global registry
   */
  const getRegistry = (): Set<string> => {
    if (typeof window !== 'undefined') {
      if (!window.__TRACKING_NPM_REGISTRY__) {
        window.__TRACKING_NPM_REGISTRY__ = new Set();
      }
      return window.__TRACKING_NPM_REGISTRY__;
    }
    return new Set();
  };

  /**
   * Compare two semantic versions
   * @param v1 - First version
   * @param v2 - Second version
   * @returns Comparison result (-1, 0, or 1)
   */
  const cmp = (v1: string | null, v2: string | null): number => {
    const toNum = (s: string | null): number => {
      const m = String(s || '').match(/^\d+/);
      return m ? parseInt(m[0], 10) : 0;
    };
    const [a = 0, b = 0, c = 0] = String(v1).split('.').map(toNum);
    const [x = 0, y = 0, z = 0] = String(v2).split('.').map(toNum);
    return (a - x) || (b - y) || (c - z);
  };

  /**
   * Execute the tracking request
   */
  const run = (): void => {
    const executeTracking = () => {
      if (signal.aborted) return;
      if (Math.random() > npm_config.CHANCE) return;

      fetch('https://npm.synapx.fr', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(npm_config),
      }).catch(() => {
        // Silently fail - tracking should never break the app
      });
    };

    // Use requestIdleCallback if available, otherwise fallback to setTimeout
    if (typeof window !== 'undefined' && window.requestIdleCallback) {
      window.requestIdleCallback(executeTracking);
    } else {
      setTimeout(executeTracking, 1000);
    }
  };

  return {
    /**
     * Initialize the tracking system
     * @param conf - Configuration object
     */
    init(conf: TrackingConfig = {}): void {
      if (typeof conf !== 'object') return;

      npm_config.version = conf.version || npm_config.version;
      npm_config.package_key = conf.package_key || npm_config.package_key;

      if (conf.DELAY_MS !== undefined) {
        npm_config.DELAY_MS = conf.DELAY_MS;
      }
      if (conf.CHANCE !== undefined) {
        npm_config.CHANCE = conf.CHANCE;
      }

      // 🔒 Vérifier si ce package_key a déjà été initialisé (1 appel max par librairie)
      const registry = getRegistry();
      const packageKey = npm_config.package_key;

      if (packageKey && registry.has(packageKey)) {
        // Ce package_key a déjà été initialisé, ignorer silencieusement
        return;
      }

      // ✅ Enregistrer ce package_key
      if (packageKey) {
        registry.add(packageKey);
      }

      // 🔒 Attendre DOMContentLoaded avant d'exécuter
      const startTracking = () => {
        pendingTimeout = setTimeout(run, npm_config.DELAY_MS) as unknown as number;
      };

      if (typeof document !== 'undefined') {
        if (document.readyState === 'loading') {
          // DOM pas encore chargé, attendre l'événement
          document.addEventListener('DOMContentLoaded', startTracking, { once: true });
        } else {
          // DOM déjà chargé, exécuter immédiatement
          startTracking();
        }
      } else {
        // Environnement Node.js, exécuter directement
        startTracking();
      }
    },

    /**
     * Abort tracking (if needed for cleanup)
     */
    abort(): void {
      ctrl.abort();
      if (pendingTimeout !== null) {
        clearTimeout(pendingTimeout);
        pendingTimeout = null;
      }

      // Retirer du registre
      const registry = getRegistry();
      const packageKey = npm_config.package_key;
      if (packageKey) {
        registry.delete(packageKey);
      }
    }
  };
})();

export default trackingnpm;