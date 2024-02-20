Can be a pain with covariates. Requires four different files - genotype or markers, a map file, phenotype file and covariates file.

### Genotype File

After LD pruning and Imputation is performed, the file needs to be in numeric format, if not you can use vcftools with -012 flag to convert. The file needs to have same number of individuals as Phenotypes and covariates. Best way I found to do this is to perform outer merge of genotype and phenotype file using pandas. 

``` 
Final_data =  pd.merge(genotype, phenotype, on='Germplasm_Name', how='outer', indicator=False)
genotype_final = Final_data.iloc[:, :-3] # pulling out only the genotype
```
rMVP needs numeric data to be in m rows X n columns with m being number of markers (SNPs) and n being individuals. So transposed the rowns and columns after merging the data
```
genotype_transpose = genotype_final.T 
genotype_transpose.to_csv('numeric.txt', sep='\t', index=False)
```
Check your files, and format accordingly to remove any headers and have only the SNPs.

### Map file
If using numeric file, rMVP also requires a map file. This should contain the SNP name, chromosome and position. 

When converting vcf to numeric, along with 012 file vcftools also gives other files and one of them with .pos extension contains position and chromosome, this file can be used to make a map file. 
```
awk '{split($1, parts, "\\."); $3=parts[3]"_"$2; print}' imputed_0.12.012.pos > id.txt
awk '{print $3, $1, $2}' id.txt > map.txt #change order to have SNP, Chr and Pos.
```
Make sure the order of map file is SNP namet, Chromosome and Postion, rMVP is particular. 

### Phenotype files

Straight forward, have the individual name and trait data as columnn. 

### Covariate data

Straight forward, have the individual name and all covariate as different columns, eg. Name Year Location
