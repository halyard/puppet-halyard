require 'yaml'

Facter.add('github_token') do
  has_weight 10
  setcode do
    github_token_file = "/var/root/.octoauth.d/halyard.yml"
    return nil unless File.exist? github_token_file
    YAML.load(File.read(github_token_file))['halyard']
  end
end
