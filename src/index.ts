import { registerPlugin } from '@capacitor/core';

import type { AudioPermissionsPlugin } from './definitions';

const AudioPermissions = registerPlugin<AudioPermissionsPlugin>(
  'AudioPermissions',
  {
    web: () => import('./web').then(m => new m.AudioPermissionsWeb()),
  },
);

export * from './definitions';
export { AudioPermissions };
