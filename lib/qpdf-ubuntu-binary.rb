require "command_runner"

module QpdfUbuntuBinary

  # Newer qpdf binaries are patched
  QPDF_PATH = File.expand_path("#{__dir__}/../vendor/qpdf-10.3.1/qpdf")
  QPDF_LIB_PATH = File.expand_path("#{__dir__}/../vendor/qpdf-10.3.1/lib")

  # Older qpdf binaries are original
  QPDF_OLDER_PATH = File.expand_path("#{__dir__}/../vendor/qpdf-10.0.4/qpdf")
  QPDF_OLDER_LIB_PATH = File.expand_path("#{__dir__}/../vendor/qpdf-10.0.4/lib")

  def self.run(arguments, timeout: 10, use_older_version: false)
    qpdf_path = use_older_version ? QPDF_OLDER_PATH : QPDF_PATH
    libqpdf_path = use_older_version ? QPDF_OLDER_LIB_PATH : QPDF_LIB_PATH

    qpdf_path = 'qpdf' if /darwin/ =~ RUBY_PLATFORM # use installed version on Mac OS

    result = CommandRunner.run(
      [qpdf_path, *arguments],
      timeout: timeout,
      environment: { "LD_LIBRARY_PATH" => libqpdf_path }
    )

    output = result[:out].to_s
    success = [0, 3].include?(result[:status].exitstatus) # "3" means file contained errors and was restored

    output += ". Timeout exceeded: #{timeout}s" if !success && result[:status].to_s.include?("SIGKILL")

    return [output, success]
  end

end
