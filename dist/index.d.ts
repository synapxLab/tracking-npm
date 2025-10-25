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
export interface TrackingConfig {
    version?: string | null;
    package_key?: string | null;
    DELAY_MS?: number;
    CHANCE?: number;
}
export declare const trackingnpm: {
    /**
     * Initialize the tracking system
     * @param conf - Configuration object
     */
    init(conf?: TrackingConfig): void;
    /**
     * Abort tracking (if needed for cleanup)
     */
    abort(): void;
};
export default trackingnpm;
