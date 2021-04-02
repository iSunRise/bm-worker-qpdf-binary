module BmWorkerQpdfBinary

  VERSION = "10.3.1"

  def self.qpdf_path
    return File.expand_path("#{__dir__}/../bin/qpdf")
  end

  def self.libqpdf_path
    return File.expand_path("#{__dir__}/../bin/libqpdf")
  end

end
