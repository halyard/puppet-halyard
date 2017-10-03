require 'etc'

Facter.add(:homedirs) do
  setcode do
    Etc::Passwd.each_with_object({}) do |user, obj|
      [user.uid, user.name].each { |key| obj[key] = user.dir }
    end
  end
end
