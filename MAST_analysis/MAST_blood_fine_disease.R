rm(list=ls())
source('/wynton/home/oh/jhe3/MAST_FM/MAST_R_notebooks/dge_mast_functions.R')
# XAUT2-blood, 'disease"
# define the dataset names, input and output directories,  at the very top
# 1) define the input and output directories
output_dir = '/wynton/home/oh/jhe3/MAST_FM/export_matrix_220613_blood_RNA_JHcombined/' # write DGE .csvs here 
input_dir_prefix= '/wynton/home/oh/jhe3/MAST_FM/export_matrix_220613_blood_RNA_JHcombined/'
# 2) dataset names (individual h5ad files)
datasets = c('HC_CPI_colitis','HC_UC', 'UC_CPI_colitis')
# 3) conditions, baseline_conds, contrast_conds
condition = 'condition'
list_baseline_conds = c('HC','HC','UC')
list_contrast_conds = c('CPI_colitis','UC','CPI_colitis')
# 4) annotation_granularity (name of the cell-type annotation group. i.e. coarse or fine)
annotation = "fine"

dgeAllDatasets(input_dir_prefix = input_dir_prefix, output_dir = output_dir,
               datasets = datasets, condition = condition, 
               list_baseline_conds = list_baseline_conds,
               list_contrast_conds = list_contrast_conds,
               out_id = 'fine',ann_col = 'fine',regr_ngenes = T)



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
merge_organs(tissues=datasets, file_id ='DGE_allcelltypes_fine.csv', file_name='XAUT2_blood_disease_',
             output_file_id = 'fine', covariate = 'ngenes', write_out=TRUE, input_dir = input_dir_prefix)
