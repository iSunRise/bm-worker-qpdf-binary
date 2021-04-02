### QPDF binary build on Ubuntu 14.04

Origin qpdf repository: https://github.com/qpdf/qpdf

qpdf version: 10.3.1

### Applied patches

- use CropBox instead of TrimBox when apply overlay/underlay

### Use

Get qpdf executable path:
```ruby
$> BmWorkerQpdfBinary.qpdf_path
```

In order to work, qpdf requires libqpdf to be present in /usr/local/lib or `LD_LIBRARY_PATH` ENV var must point to library location.

Get qpdf lib location:
```ruby
$> BmWorkerQpdfBinary.libqpdf_path
```
