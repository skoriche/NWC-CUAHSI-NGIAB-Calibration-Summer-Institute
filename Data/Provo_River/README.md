# Example Data Explanation

## Data Preparation Command

The following command was used to create the folder structure:

```bash
uvx ngiab-prep -i gage-10154200 --start 2007-10-01 --end 2013-09-30 -sfr --source nwm
```

## Geometry Information

Geometry is sourced from the v2.2 derived [community hydrofabric](https://communityhydrofabric.s3.us-east-1.amazonaws.com/index.html). The geometry was subset from the CONUS hydrofabric using the code located at:

```
tools/NGIAB_data_preprocess/modules/data_processing/subset.py
```

## Model Configuration

Individual configuration files are generated using code in:

```
tools/NGIAB_data_preprocess/modules/data_processing/create_realization.py
```

This script uses values provided in the divide-attributes table from the v2.2 hydrofabric to populate templates for:
- CFE (Conceptual Functional Equivalent)
- NOM (Next-generation Operational Model)

These templates are located in:

```
tools/NGIAB_data_preprocess/modules/data_sources/
```

## Forcing Data

### Source
Raw gridded forcing data comes from the [NWM Retrospective v3 Forcing dataset](https://noaa-nwm-retrospective-3-0-pds.s3.amazonaws.com/index.html#CONUS/zarr/forcing/).

### Processing
- Weights are calculated using [exactextract](https://isciences.github.io/exactextract/)
- Final computations are performed with NumPy