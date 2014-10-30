require 'spec_helper'

%w( crond ntpd postfix rsyslog sshd ).each do |svc|
  describe "monit-ng::#{svc}" do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(step_into: ['monit_check'])
      .converge(described_recipe)
    end

    it "installs the #{svc} check" do
      expect(chef_run).to create_monit_check(svc)
    end
  end
end
