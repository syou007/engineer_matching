class AppConfig

  # ymlファイルの読み込みを行います。
  @@yml = nil

  # データを取得します。
  def self.get(*keys)
    yml = AppConfig.yml["app"]
    keys.each { |key|
      yml = yml[key.to_s]
    }
    return yml
  end

  private

  # ymlデータを取得します。
  def self.yml
    # debug時はyamlファイルは毎回読む。
    @@yml = YAML.load_file("#{Rails.root}/config/app_config.yml") if !@@yml || @@yml["app"]["env"][Rails.env]["debug"]
    @@yml
  end
end