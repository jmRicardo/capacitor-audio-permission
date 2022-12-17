import type { PermissionState } from '@capacitor/core';

export interface PermissionStatus {
  status: PermissionState | 'undetermined';
}

export interface AudioPermissionsPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  checkPermissions(): Promise<PermissionStatus>;
  requestPermissions(): Promise<PermissionStatus>;
}
