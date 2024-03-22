rm(list=ls())
source('/wynton/home/oh/jhe3/Luoma3_MAST/dge_mast_functions.R')
# XAUT2-Biopsies, 'disease"
# define the dataset names, input and output directories,  at the very top
# 1) define the input and output directories
output_dir = '/wynton/home/oh/jhe3/Luoma3_MAST/' # write DGE .csvs here 
input_dir_prefix= '/wynton/home/oh/jhe3/Luoma3_MAST/3converted/disease/'
# 2) dataset names (individual h5ad files)
datasets = c('3_CPI_colitis_CPI_only','3_CPI_colitis_healthy', '3_healthy_CPI_only')
# 3) conditions, baseline_conds, contrast_conds
condition = 'condition'
list_baseline_conds = c('CPI_colitis','CPI_colitis','healthy')
list_contrast_conds = c('CPI_only','healthy','CPI_only')
# 4) annotation_granularity (name of the cell-type annotation group. i.e. coarse or fine)
annotation = "coarse"

#dgeAllDatasets(input_dir_prefix = input_dir_prefix, output_dir = output_dir,
#               datasets = datasets, condition = condition, 
#               list_baseline_conds = list_baseline_conds,
#               list_contrast_conds = list_contrast_conds,
#               out_id = 'coarse',ann_col = 'coarse',regr_ngenes = T)



# dgeDataset(input_dir_prefix = input_dir_prefix,
#              output_dir = output_dir,
#              dataset =dataset, 
#              ann_col = ann_col, 
#              data_id = out_id, 
#              regress_ngenes = regr_ngenes,
#              condition = condition,
#              baseline_cond = baseline_cond,
#              contrast_cond = contrast_cond)

# merge the results into one dataframe
merge_organs(tissues=datasets, file_id ='DGE_allcelltypes_coarse.csv', file_name='3_disease_',
             output_file_id = 'coarse', covariate = 'ngenes', write_out=TRUE, input_dir = input_dir_prefix)