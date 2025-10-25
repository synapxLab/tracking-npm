'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

/**
 * 🛰️ @synapxlab/tracking-npm
 *
 * Lightweight NPM package usage tracker
 * - Waits 10s before execution
 * - Executes at idle (or after 1s fallback)
 * - 1% execution probability (configurable)
 *
 * @see https://synapx.fr/sdk/Tracking_NPM/
 */
const trackingnpm = (() => {
    const npm_config = {
        version: null,
        package_key: null,
        DELAY_MS: 10000,
        CHANCE: 0.01
    };
    const ctrl = new AbortController();
    const signal = ctrl.signal;
    /**
     * Execute the tracking request
     */
    const run = () => {
        const executeTracking = () => {
            if (signal.aborted)
                return;
            if (Math.random() > npm_config.CHANCE)
                return;
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
        }
        else {
            setTimeout(executeTracking, 1000);
        }
    };
    return {
        /**
         * Initialize the tracking system
         * @param conf - Configuration object
         */
        init(conf = {}) {
            if (typeof conf !== 'object')
                return;
            npm_config.version = conf.version || npm_config.version;
            npm_config.package_key = conf.package_key || npm_config.package_key;
            if (conf.DELAY_MS !== undefined) {
                npm_config.DELAY_MS = conf.DELAY_MS;
            }
            if (conf.CHANCE !== undefined) {
                npm_config.CHANCE = conf.CHANCE;
            }
            setTimeout(run, npm_config.DELAY_MS);
        },
        /**
         * Abort tracking (if needed for cleanup)
         */
        abort() {
            ctrl.abort();
        }
    };
})();

exports.default = trackingnpm;
exports.trackingnpm = trackingnpm;
//# sourceMappingURL=index.js.map
