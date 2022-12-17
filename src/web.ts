import { WebPlugin } from '@capacitor/core';

import type { AudioPermissionsPlugin, PermissionStatus } from './definitions';

export class AudioPermissionsWeb
  extends WebPlugin
  implements AudioPermissionsPlugin
{
  checkPermissions(): Promise<PermissionStatus> {
    throw this.unimplemented('Not implemented on web.');
  }
  requestPermissions(): Promise<PermissionStatus> {
    throw this.unimplemented('Not implemented on web.');
  }
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
