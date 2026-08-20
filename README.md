# capacitor-audio-permission

Plugin sencillo para solicitar permiso de microfono en Android y iOS.

## Install

```bash
npm install capacitor-audio-permission
npx cap sync
```
## Usage

Aclaración:

Para poder solicitar el permiso en Android es necesario agregar RECORD_AUDIO al manifest.xml:

```

<uses-permission android:name="android.permission.RECORD_AUDIO"/>

```

## ProGuard / R8 (Android)

Nothing to configure. The plugin ships its own `consumer-rules.pro`, so the keep
rules it needs are merged into your app's R8 configuration automatically when
you build with `minifyEnabled true`.

They are deliberately narrow: only the Capacitor annotation types (which R8
would otherwise drop, taking `PluginHandle.pluginAnnotation` with them and
turning any `checkPermissions()` call into a fatal NPE) and the plugin's
`@PluginMethod` entry points. Everything else in the plugin stays obfuscated,
and you do not need the usual catch-all
`-keep class * extends java.lang.annotation.Annotation` in your app.

## API

<docgen-index>

* [`checkPermissions()`](#checkpermissions)
* [`requestPermissions()`](#requestpermissions)
* [Interfaces](#interfaces)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### checkPermissions()

```typescript
checkPermissions() => Promise<PermissionStatus>
```

**Returns:** <code>Promise&lt;<a href="#permissionstatus">PermissionStatus</a>&gt;</code>

--------------------


### requestPermissions()

```typescript
requestPermissions() => Promise<PermissionStatus>
```

**Returns:** <code>Promise&lt;<a href="#permissionstatus">PermissionStatus</a>&gt;</code>

--------------------


### Interfaces


#### PermissionStatus

| Prop        | Type                                                                          |
| ----------- | ----------------------------------------------------------------------------- |
| **`audio`** | <code><a href="#permissionstate">PermissionState</a> \| 'undetermined'</code> |


### Type Aliases


#### PermissionState

<code>'prompt' | 'prompt-with-rationale' | 'granted' | 'denied'</code>

</docgen-api>
