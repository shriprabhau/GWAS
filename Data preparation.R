#R script
conda activate r-env
Library(rMVP)
library(rMVP)
MVP.Data(fileNum="numeric.txt",
                  filePhe="trait.txt",
                          fileMap="map.txt",
                           #sep.num="\t",
                                    #sep.map="\t",
                                    #sep.phe="\t",
                                             fileKin=FALSE,
                                             filePC=FALSE,
                                                      #priority="memory",
                                                      #maxLine=10000,
                                                      out="mvp"
                                                      )

#check your geno.map file, to have the header in caps - SNP CHROM and POS 
#else it reads it as another marker and throws the error markers in genotype and map don't match, which is extremely weird if you ask me 
