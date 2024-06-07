# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['autoShutter.py'],
    pathex=[],
    binaries=[],
    datas=[('icons/', 'icons'), ('AppleScripts/', 'AppleScripts')],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name='autoShutter',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=['icons/AutoShutterIcon.icns'],
)
app = BUNDLE(
    exe,
    name='iPhoneShutterControlForSyrpGenie.app',
    icon='icons/AutoShutterIcon.icns',
    bundle_identifier=None,
)
