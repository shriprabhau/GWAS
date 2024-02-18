Can be a pain with covariates. 

After LD pruning and Imputation is performed, the file needs to be in numeric format, if not you can use vcftools with -012 flag to convert. The file needs to have same number of individuals as Phenotypes and covariates. Best way I found to do this is to perform outer merge of genotype and phenotype file using pandas. 

` Final_data =  `
