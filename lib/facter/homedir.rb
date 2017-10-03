require 'etc'

Facter.add(:interfaces_hash) do
  setcode do
    Etc.passwd { |u| [u.name, u.dir] }.to_h
  end
end
