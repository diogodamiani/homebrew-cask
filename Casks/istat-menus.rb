cask 'istat-menus' do
  version '5.32'
  sha256 '99e1a262cddc9bf368cb01854610b64b8c5551ace4f5a89aad6d63ca054e5ecf'

  # amazonaws.com/bjango was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/bjango/files/istatmenus#{version.major}/istatmenus#{version}.zip"
  name 'iStats Menus'
  homepage 'https://bjango.com/mac/istatmenus/'

  auto_updates true

  app 'iStat Menus.app'

  uninstall delete:    "/Library/Application Support/iStat Menus #{version.major}",
            launchctl: [
                         'com.bjango.istatmenusagent',
                         'com.bjango.istatmenusdaemon',
                         'com.bjango.istatmenusnotifications',
                         'com.bjango.istatmenusstatus',
                       ],
            signal:    [
                         ['TERM', 'com.bjango.iStat-Menus-Notifications'],
                         ['TERM', 'com.bjango.iStatMenusAgent'],
                         ['TERM', 'com.bjango.istatmenusstatus'],
                         ['TERM', 'com.bjango.istatmenus'],
                         ['HUP', 'com.bjango.istatmenus'],
                       ]

  zap trash: [
               '~/Library/Application Support/iStat Menus',
               '~/Library/Caches/com.bjango.istatmenus',
               '~/Library/Caches/com.bjango.istatmenusstatus',
               '~/Library/Caches/com.bjango.iStat-Menus-Updater',
               '~/Library/Caches/com.bjango.iStatMenusAgent',
               '~/Library/Logs/iStat Menus',
               '~/Library/Preferences/com.bjango.istatmenus.plist',
               "~/Library/Preferences/com.bjango.istatmenus#{version.major}.extras.plist",
               '~/Library/Preferences/com.bjango.istatmenusstatus.plist',
             ]
end
