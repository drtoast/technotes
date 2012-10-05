# http://www.opscode.com/
# http://wiki.opscode.com/display/chef/A+Can+of+Condensed+Chef+Documentation
# http://www.engineyard.com/blog/2011/why-chef-should-manage-deploying-your-application/

# DIRECTORY STRUCTURE
=begin

/etc/chef/
    cookbooks/
        cookbook1/
            attributes/
                default.rb
            libraries/
                ruby_code.rb
            recipes/
                default.rb
            files/
                default/
            templates/
                default/
        cookbook2/
    node.json
    solo.rb

=end


# CHEF DSL

cookbook_file "/etc/ntpd.conf" do
    owner "root"
    group "root"
    mode 0644
    source "ntpd.conf"
end


# define a node for two different platforms:

case node[:platform]
when 'gentoo'
    package "dev-java/sun-jdk"
when 'ubuntu'
    package "openjdk-6-jdk"
end

# solo.rb - entrypoint
log_level :debug
log_location "/var/log/chef.log"
file_store_path File.join(File.dirname(__FILE__))
file_cache_path File.join(File.dirname(__FILE__))
cookbook_path [
    File.join(File.dirname(__FILE__), "cookbooks")
]

# node.json - define a run list of cookbooks
{ "run_list": "main" }

# define the 'main' cookbook:
case node[:platform]
when 'ubuntu'
    require_recipe 'ubuntu_base'
    require_recipe 'ubuntu_packages'
when 'gentoo'
    require_recipe 'gentoo_base'
    require_recipe 'gentoo_packages'
end
