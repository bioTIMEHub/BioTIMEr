# gridding BioTIME data

gridding BioTIME data

## Usage

``` r
gridding_internal(meta, btf, res, resByData, verbose)
```

## Arguments

- meta:

  (`data.frame`, `tibble` or `data.table`) BioTIME metadata.

- btf:

  (`data.frame`, `tibble` or `data.table`) BioTIME data.

- res:

  (`integer`) cell resolution. Must be in the range \[0,30\]. Larger
  values represent finer resolutions. Default: 12 (~96 sq km). Passed to
  [`dgconstruct`](https://rdrr.io/pkg/dggridR/man/dgconstruct.html).

- resByData:

  (`logical`) FALSE by default. If TRUE, the function
  [`dg_closest_res_to_area`](https://rdrr.io/pkg/dggridR/man/dg_closest_res_to_area.html)
  is called to adapt `res` to the data extent. The new `res` value is
  used even if a value is provided byt the user.

- verbose:

  if TRUE, a warning will be shown when one-year-long time series are
  found in btf and excluded.
