# BENCHMARKS

## Inserts

### N = 1,000

Simple:  3.211
JSONB:   3.984
EAV:    12.471

### N = 10,000

Simple:  25.162
JSONB:   25.701
EAV:    127.223

## Updates

### N = 1,000

Simple:  3.378
JSONB:   3.468
EAV:     4.356

## Selects

### N = 1,000

Simple:  1.597
JSONB:   2.350
EAV:     2.772

## Sort

### N = 1,000

Simple:   0.855
Simple:   1.134 (w/o index)
JSONB:    1.945

### N = 10,000

Simple:   2.292
Simple:  23.725 (w/o index)
JSONB:  103.310
