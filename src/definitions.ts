import type { PermissionState } from '@capacitor/core';

export interface PermissionStatus {
  audio: PermissionState | 'undetermined';
}

export interface AudioPermissionsPlugin {
  checkPermissions(): Promise<PermissionStatus>;
  requestPermissions(): Promise<PermissionStatus>;
}
