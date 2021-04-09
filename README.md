### QPDF binary build on Ubuntu 14.04

Origin qpdf repository: https://github.com/qpdf/qpdf

qpdf version: 10.3.1

### Applied patches

- use CropBox instead of TrimBox when apply overlay/underlay

### Use

Run qpdf executable:
```ruby
$> QpdfUbuntuBinary.run(
  [command_line_arg1, command_line_arg2], # arguments passed to qpdf
  timeout: 10,                            # timeout in seconds (optional, default = 10 seconds)
  use_older_version: false                # use qpdf v10.0.4, see notes below (optional, default = false)
 )
```
### QPDF v10.0.4
There are a wide variation of PDF creators which could build files not fully compliant with PDF 1.X standards or even broken. QPDF attempts to recover such files automatically. After the QPDF 10.1.0 release the library fails on some damaged documents which could be processed without any issues before. That’s why we include 2 versions of the same library and allow you to select which one to use.
However, there are options available only in newer build: `---flatten-annotations` and `--overlay`.
Despite `--overlay` is available in older version, it doesn’t work as expected ("use CropBox" patch is not applied to older version).
