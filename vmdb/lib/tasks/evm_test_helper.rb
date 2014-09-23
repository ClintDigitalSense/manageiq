module EvmTestHelper
  def self.run_rake_via_shell(rake_command, env = {})
    cmd = "bundle exec rake #{rake_command}"
    cmd << " --trace" if Rake.application.options.trace
    _pid, status = Process.wait2(Kernel.spawn(env, cmd, :chdir => Rails.root))
    exit(status.exitstatus) if status.exitstatus != 0
  end
end
