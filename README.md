# avert_report: Generate a report from the avert computational model

This is the shell of a reporting template to be used in conjunction with the avert computational model.

This reporting template is designed for use in conjunction with the `avert` R library. You can install `avert` with the following commands.

``` r
utils::install.packages("remotes")

remotes::install_github("avertableburden/avert")
```

To render a report using the latest release of this template:

``` r
library(avert)
write_avert_report(get_input_data(), output_dir_1L_chr = tempdir())
```

Alternatively, if you clone this repository to your machine, you can render the latest development version of the template from within the parent directory of the cloned repository:

``` r
library(avert)
write_avert_report(get_input_data(), mkdn_source_dir_1L_chr = getwd(), output_dir_1L_chr = "Tests")
```

An example of a PDF report produced with the above calls is available for download [here](https://github.com/avertableburden/avert_report/releases/download/v0.1.1/Example_Report.pdf).