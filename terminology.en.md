# Terminology for Medical Statistics and Genetic Epidemiology

This glossary is adapted from the supplied thesis terminology table. It preserves that project's terminology decisions rather than imposing them as universal disciplinary rules. Adapt it when reusing the template for a different study or journal.

- `.academic-writing-terms.json` provides Chinese canonical names. The plugin automatically reads it beside the selected main manuscript; valid English equivalents and retained abbreviations are accepted for English abstracts, captions and first-use definitions.
- `terminology.en.json` provides English canonical names for the same concepts and rules.
- `术语表.md` contains the Chinese documentation and original contextual boundary rules.

Cloning either template through New manuscript includes these files. Automatic audit loading does not register a Sources-panel entry. To expose the glossary to AI revision prompts, link the active JSON through the existing glossary control.

For an English-first project, back up the default file and replace its contents with `terminology.en.json`. Do not load both profiles together: different canonical names for the same forms conflict. Run project-wide checks from the main file at the repository root; a chapter checked independently only discovers the sidecar beside that chapter.

The JSON format uses a `terms` array and the fields `canonical`, `allowed`, `forbidden`, optional `variants`, and `reason`. A form has one owner. Different concepts have separate entries. Forbidden forms are review candidates with explicit source support, not instructions for automatic replacement. Language-specific restrictions, inflection, abbreviation definition order and conditional naming rules need contextual review.

Define a retained abbreviation separately in each abstract and main-text domain. In Chinese, use the Chinese full term followed by the English full form and abbreviation in parentheses; in English, use the English full form followed by the abbreviation. Use the established abbreviation thereafter, while respecting the source's heading and fixed-term exceptions. Do not introduce additional abbreviations for low-frequency ordinary terms.

## Standard terms

| English canonical term | Chinese equivalent | Retained abbreviation or short form | Source convention and conceptual boundary |
|---|---|---|---|
| P value | P值 | — | Use capital P; Chinese prose uses P值. Journal typography may override the English spacing. |
| type I error rate | 第一类错误率 | — | A rejection probability under the null; do not confuse an error with its rate. |
| statistical power | 检验效能 | — | A rejection probability under the alternative; distinguish it from type I error rate. |
| confidence interval | 置信区间 | — | Chinese prose uses the full Chinese term; an English abbreviation needs its own definition. |
| standard error | 标准误 | SE | Retain SE after defining it separately in each abstract or main-text domain; distinguish it from standard deviation. |
| effect estimate | 效应估计值 | — | A realized numerical estimate, not an estimator or a generic effect size. |
| causal effect | 因果效应 | — | Preserve the causal interpretation and its assumptions. |
| confounder | 混杂因素 | — | A variable affecting exposure and outcome; not the bias it can cause. |
| confounding bias | 混杂偏倚 | — | Bias due to confounding; not a confounder. |
| bias due to reverse causation | 反向因果偏倚 | — | Distinguish the bias from reverse causation as a process. |
| linear regression model | 线性回归模型 | — | Use the model name when referring to the statistical model. |
| logistic regression model | logistic回归模型 | — | Keep logistic in lowercase within running text. |
| coverage probability | 覆盖率 | — | The probability that an interval contains the target parameter; empirical coverage estimates this probability. |
| variance-covariance matrix | 方差-协方差矩阵 | — | Retain specialized names such as cross-covariance matrix or joint covariance matrix when required. |
| complex trait | 复杂性状 | — | Use trait consistently for the relevant genetic phenotype. |
| genetic variant | 遗传变异 | — | Distinguish a variant from a locus and from an allele. |
| allele | 等位基因 | — | Use the established genetic term. |
| genotype | 基因型 | — | Distinguish genotype from phenotype. |
| phenotype | 表型 | — | Distinguish phenotype from genotype. |
| linkage disequilibrium | 连锁不平衡 | LD | Define LD before subsequent abbreviated use. |
| linkage disequilibrium pruning | 连锁不平衡剪枝 | LD 剪枝, LD pruning | After defining LD, use LD pruning; do not substitute clumping without checking the actual procedure. |
| allele frequency | 等位基因频率 | — | A frequency, not a count of alleles. |
| heritability | 遗传度 | — | Use the project's preferred Chinese translation 遗传度. |
| polygenic risk score | 多基因风险评分 | — | The Chinese source retains the full Chinese term rather than PRS; do not introduce an abbreviation without a project decision. |
| genome-wide association study | 全基因组关联研究 | GWAS | Define GWAS separately in each writing domain. |
| Mendelian randomization | 孟德尔随机化 | MR | Define MR separately in each writing domain. |
| family-based genome-wide association study | 家系全基因组关联研究 | FGWAS | The project retains FGWAS; do not equate every family-based design with a within-sibship design. |
| population-based GWAS | 一般人群 GWAS | — | Use for comparison with family-based GWAS; traditional GWAS is reserved for a historical or baseline-method context. |
| family-based Mendelian randomization | 家系孟德尔随机化 | FGWAS-MR | The project uses FGWAS-MR as its formal label; generic family-based MR descriptions still require context. |
| inverse-variance weighted method | 逆方差加权法 | IVW, MR-IVW, inverse-variance weighted | Define IVW first, then introduce the project comparison label MR-IVW; MR-IVW-F denotes its family-based version. |
| instrumental variable | 工具变量 | IV | Define IV at first use. Chinese prose uses IV rather than IVs; English plurals depend on grammar. |
| direct genetic effect | 直接遗传效应 | DGE | Define DGE at first use. |
| indirect genetic effect | 间接遗传效应 | IGE | Define IGE at first use; genetic nurture is one manifestation of parental IGE, not its synonym. |
| Instrument Strength Independent of Direct Effect assumption | 工具强度独立于直接效应假设 | InSIDE 假设, InSIDE assumption, InSIDE, Instrument Strength Independent of Direct Effect | Define InSIDE at first use and retain its capitalization. |
| model averaging | 模型平均 | MA | Define MA at first use. |
| data perturbation | 数据扰动 | DP | Define DP at first use. |
| goodness-of-fit test | 拟合优度检验 | GoF, GoF 检验, GoF test | Define GoF at first use; retain GoF test thereafter. |
| modified Bayesian information criterion | 修正贝叶斯信息准则 | BIC' | The project retains BIC'; preserve the prime in prose and formulas. |
| average non-transmitted coefficient | 平均未传递亲代效应估计量 | NTC | Retain the source expansion and NTC label; replace a generic parental-effect phrase only if it denotes this same quantity. |
| Mendelian randomization analysis using mixture models | 混合模型孟德尔随机化方法 | MRMix, Mendelian randomization mixture model | The source uses MRMix as the method name; distinguish it from the Gaussian mixture model used by the method. The published description is Mendelian randomization analysis using mixture models. |
| allele harmonization | 等位基因协调 | — | Align effect alleles and their effect directions across exposure and outcome data. |
| Monte Carlo simulation | 蒙特卡罗模拟 | — | Names the random simulation procedure, rather than the overall study design. |
| simulation study | 模拟研究 | — | Use for study design, chapter names and overall evaluation. |
| empirical analysis | 实例分析 | — | The Chinese source reserves 实例分析 for chapter or section names. |
| real-data analysis | 真实数据分析 | — | Use for analysis procedures and results involving actual data. |
| deoxyribonucleic acid | 脱氧核糖核酸 | DNA | Define DNA before abbreviated use. |
| single nucleotide polymorphism | 单核苷酸多态性 | SNP | Define SNP before abbreviated use; English plurals may use SNPs. |
| body mass index | 体质指数 | BMI | Define BMI before abbreviated use. |
| whole-genome sequencing | 全基因组测序 | WGS | Define WGS before abbreviated use. |
| whole-exome sequencing | 全外显子组测序 | WES | Define WES before abbreviated use. |
| genotyping array | 基因芯片 | — | Use the established platform term; avoid mixing Chinese and English labels in Chinese prose. |
| genotype imputation | 基因型插补 | — | Use 基因型插补 in Chinese; do not confuse imputation with measurement. |
| horizontal pleiotropy | 水平多效性 | — | Retain horizontal when describing its subtypes. The source excludes the label 方向性水平多效性 as a project convention, not a general claim about the field. |
| balanced horizontal pleiotropy | 平衡水平多效性 | — | Retain horizontal in the subtype name. |
| correlated horizontal pleiotropy | 相关水平多效性 | — | Retain horizontal; distinguish the confounding pathway from direct horizontal pleiotropy. |
| uncorrelated horizontal pleiotropy | 非相关水平多效性 | — | Retain horizontal in the subtype name. |
| direct horizontal pleiotropy | 直接水平多效性 | — | The variant affects the outcome without a pathway through an unobserved confounder; the source uses $l_{o,j}$, $l_{f,j}$ and $l_{m,j}$. |
| population stratification | 群体分层 | — | A population-level source of confounding. |
| genetic nurture | 遗传养育效应 | — | One manifestation of parental IGE; do not treat it as the whole category of indirect genetic effects. |
| assortative mating | 选型婚配 | — | Use the source's preferred Chinese term 选型婚配. |
| dynastic effect | 世袭效应 | — | Use the source's preferred Chinese term 世袭效应 rather than 王朝效应. |
| nuclear family | 核心家系 | — | A family consisting of parents and offspring. |
| sibling pair | 同胞对 | sib-pair | Use 同胞对 in Chinese; English sib-pair is an accepted equivalent. |
| offspring | 子代 | — | Use 子代 in Chinese prose; English offspring remains valid in English abstracts. |
| paternal | 父源 | — | Describes the source of an effect; distinguish this from the father's observed genotype. |
| maternal | 母源 | — | Describes the source of an effect; distinguish this from the mother's observed genotype. |
| father's genotype | 父亲基因型 | — | The father's actual genotype; not a label for the origin of an effect. |
| mother's genotype | 母亲基因型 | — | The mother's actual genotype; not a label for the origin of an effect. |
| family mean | 家系均值 | — | A mean defined at the family level. |
| sibling difference | 同胞差分 | — | A difference between siblings, as defined by the study. |
| summary statistics | 汇总统计量 | — | Summary estimates and associated uncertainty; distinguish these from individual-level data. |
| parents | 父母 | — | Use 父母 for father and mother collectively. Retain 父母代 when discussing generations and preserve fixed names containing 亲代. |
| Mendel's laws of inheritance | 孟德尔遗传定律 | — | Use 孟德尔遗传定律 consistently in Chinese. |
| Hardy-Weinberg law | 哈代-温伯格定律 | — | The source uses the law for a generating mechanism; Hardy-Weinberg equilibrium remains valid when describing a population state. |
| effect estimator | 效应估计量 | — | A statistical object or rule, not its realized numerical effect estimate. |
| significance level | 显著性水平 | — | A prespecified testing level; distinguish it from a threshold used for variant selection. |
| significance threshold | 显著性阈值 | — | A threshold for variant selection or statistical significance; identify the relevant analysis stage. |
| test statistic | 检验统计量 | — | The statistic used by a test, not the testing procedure itself. |
| z test | z 检验 | — | Preserve the lowercase statistical symbol z. |
| sensitivity analysis | 敏感性分析 | — | Use 敏感性分析 consistently in Chinese. |
| multiple-testing correction | 多重检验校正 | — | The source fixes 多重检验校正 as its Chinese term. |
| between-study heterogeneity | 研究间异质性 | — | Variation across studies or data sources, not individual-level variation. |
| estimation bias | 估计偏倚 | — | Systematic departure of an estimator's expectation from its target. |
| stability of estimation | 估计稳定性 | — | Variation in estimation results across scenarios or repeated perturbations; not consistency. |
| empirical standard deviation | 经验标准差 | — | Dispersion across simulation replicates; not a standard error. |
| empirical variance | 经验方差 | — | Variance computed from repeated simulations or perturbations; distinguish it from theoretical variance. |
| theoretical variance | 理论方差 | — | Variance derived from a model or asymptotic argument; not empirical variance. |
| likelihood function | 似然函数 | — | Use the standard likelihood terminology. |
| log-likelihood function | 对数似然函数 | — | The logarithm of a likelihood function. |
| profile likelihood | 轮廓似然 | — | Obtained by eliminating or optimizing over nuisance parameters; the source uses 轮廓似然 in Chinese. |
| weighted profile likelihood function | 加权轮廓似然函数 | — | The specific objective used by MR-Family and related methods in the source. |
| maximum likelihood estimation | 极大似然估计 | — | Use 极大似然估计 in Chinese; distinguish an estimation procedure from its realized estimate. |
| constrained maximum likelihood | 约束极大似然 | — | The framework used by MRcML. |
| nuisance parameter | 讨厌参数 | — | Use 讨厌参数 under this project's Chinese convention. |
| observed information matrix | 观测信息矩阵 | — | Preserve observed; do not confuse it with expected information. |
| Hessian matrix | Hessian 矩阵 | — | The matrix of second derivatives; specify the objective and sign convention in context. |
| Schur complement | Schur 补 | — | Used to obtain information for target parameters from a partitioned information matrix. |
| consistency | 一致性 | — | Retain the mathematical distinction where needed; do not replace either with stability. |
| asymptotic consistency | 渐近一致性 | — | Retain the mathematical distinction where needed; do not replace either with stability. |
| consistent estimator | 一致估计量 | — | An estimator converging to its target as sample size increases. |
| asymptotic normality | 渐近正态性 | — | A property of a suitably normalized limiting distribution. |
| asymptotic variance | 渐近方差 | — | Variance in a limiting distribution or asymptotic expansion. |
| Lindeberg condition | Lindeberg 条件 | — | Retain the proper name. |
| Lyapunov condition | Lyapunov 条件 | — | Retain the proper name. |
| correlation coefficient | 相关系数 | — | A coefficient, not an unspecified association measure. |
| cross-covariance | 交叉协方差 | — | Covariance between exposure and outcome effect estimates; use cross-covariance matrix for the matrix object. |
| sampling variance-covariance matrix | 抽样方差-协方差矩阵 | — | The variance-covariance structure of estimation errors in summary statistics. |
| fixed-effect model | 固定效应模型 | — | Used for fixed-effect combination of ancestry-specific results. |
| random-effects model | 随机效应模型 | — | Allows heterogeneity in effects across ancestry groups. |
| natural randomization | 自然随机化 | — | Describes the analogy between genetic allocation and a randomized trial. |
| randomized controlled trial | 随机对照试验 | — | Use 随机对照试验 consistently in Chinese. |
| genetic epidemiology | 遗传流行病学 | — | Use the established disciplinary name. |
| relevance assumption | 相关性假设 | — | Requires an instrumental variable to be associated with the exposure. |
| independence assumption | 独立性假设 | — | Requires an instrumental variable to be independent of confounders. |
| exclusion restriction assumption | 排除限制假设 | — | Requires an instrumental variable to affect the outcome only through the exposure. |
| weak instrumental variable | 弱工具变量 | — | Chinese prose may subsequently refer to a 弱 IV 问题. |
| valid IV | 有效 IV | — | Opposite validity states; keep them as separate concepts. |
| invalid IV | 无效 IV | — | Opposite validity states; keep them as separate concepts. |
| Wald ratio method | Wald 比值法 | — | A causal-effect estimator for the single-instrument setting. |
| MR-Egger | MR-Egger | — | Preserve spelling, capitalization and the hyphen. |
| MR-Lasso | MR-Lasso | — | Preserve spelling, capitalization and the hyphen. |
| Mendelian randomization based on constrained maximum likelihood | 基于约束极大似然的孟德尔随机化 | MRcML | Define MRcML at first use and retain the method name thereafter. |
| cisMR-cML | cisMR-cML | — | Preserve the formal method name and its capitalization. |
| Gaussian mixture model | 高斯混合模型 | — | The statistical model used by MRMix, not the MRMix method name. |
| expectation-maximization algorithm | 期望最大化算法 | — | Use 期望最大化算法 in Chinese; do not reverse the two operations in its name. |
| causal analysis using summary effect estimates | 因果异常评分估计方法 | — | English rendering of the method referred to by the source's Chinese label; no new abbreviation is introduced here. The source cites Morrison et al. (2020); see the verification references below. |
| majority-valid assumption | 多数 IV 有效假设 | 多数 IV 有效 | Requires a majority of valid IV; distinguish it from a plurality condition. |
| plurality-valid condition | 最大有效 IV 组条件 | 最大有效 IV 组 | The valid IV group is the largest group under the relevant identification condition; this need not be a majority. |
| two IV sets | 双 IV 集合 | — | The offspring IV set and the auxiliary parental IV set. |
| parental effect block | 父母效应块 | — | The joint block of paternal and maternal effects for the same SNP; not a set of parental SNPs. |
| validity indicator vector | 有效性指示向量 | — | A vector marking whether candidate IV are valid. |
| sparsity constraint | 稀疏约束 | — | A constraint, not a prior or a penalty. |
| $L_0$ constraint | $L_0$ 约束 | — | Preserve the mathematical notation; do not flatten it into L0约束 in Chinese. |
| Lasso penalty | Lasso 惩罚 | — | Preserve the capitalization Lasso. |
| coordinate descent algorithm | 坐标下降算法 | — | Use 坐标下降算法 consistently in Chinese. |
| grid search | 网格搜索 | — | Search across candidate hyperparameters or combinations of valid-IV counts. |
| stability selection | 稳定性选择 | — | Use 稳定性选择 consistently in Chinese. |
| empirical Bayes | 经验贝叶斯 | — | Use 经验贝叶斯 consistently in Chinese. |
| sparse prior | 稀疏先验 | — | A Bayesian prior, not a sparsity constraint. |
| posterior distribution | 后验分布 | — | Use 后验分布 consistently in Chinese. |
| marginal likelihood | 边际似然 | — | An objective for model comparison or hyperparameter selection. |
| proximal gradient algorithm | 近端梯度算法 | — | Use 近端梯度算法 consistently in Chinese. |
| mixed-integer optimization | 混合整数优化 | — | Used for discrete selection of valid IV. |
| Mendelian trait | 孟德尔性状 | — | Distinguish it from a complex trait. |
| gene-environment interaction | 基因—环境交互作用 | — | Use 基因—环境交互作用 with the source's Chinese dash. |
| chromosome | 染色体 | — | Do not replace it with chromosome set. |
| autosome | 常染色体 | — | Distinguish it from a sex chromosome. |
| sex chromosome | 性染色体 | — | Use the established genetic term. |
| genome | 基因组 | — | Do not add whole when the context does not require it. |
| base pair | 碱基对 | — | A unit or paired bases, not the process of base pairing. |
| deoxyribonucleotide | 脱氧核苷酸 | — | Distinguish it from deoxyribonucleic acid. |
| double-helix structure | 双螺旋结构 | — | A description of DNA structure. |
| complementary base pairing | 碱基互补配对 | — | The process of complementary pairing between bases. |
| genetic locus | 遗传位点 | — | Use a gene locus only when the context specifically identifies a gene. |
| genome-wide scope | 基因组范围 | — | Used for statements about scope; retain genome-wide as an adjective where grammar requires it. |
| coding region | 编码区 | — | Use 编码区 consistently in Chinese. |
| regulatory region | 调控区 | — | Use 调控区 consistently in Chinese. |
| intergenic region | 基因间区域 | — | Use 基因间区域 consistently in Chinese. |
| effect allele | 效应等位基因 | — | The allele to which an association effect refers; distinguish it from the non-effect allele. |
| non-effect allele | 非效应等位基因 | — | The allele contrasted with the effect allele. |
| minor allele frequency | 次要等位基因频率 | — | A frequency, not a count. |
| insertion-deletion variant | 插入缺失 | — | Use 插入缺失 under the source's convention. |
| copy number variation | 拷贝数变异 | — | Use 拷贝数变异 consistently in Chinese. |
| short tandem repeat sequence | 短串联重复序列 | — | Use 短串联重复序列 consistently in Chinese. |
| structural variation | 结构变异 | — | Use 结构变异 consistently in Chinese. |
| high-throughput genotyping | 高通量基因分型 | — | Use 高通量基因分型 consistently in Chinese. |
| high-throughput sequencing | 高通量测序 | — | Use 高通量测序 as the fixed Chinese term. |
| oligonucleotide probe | 寡核苷酸探针 | — | Use 寡核苷酸探针 consistently in Chinese. |
| reference panel | 参考面板 | — | The reference data used for genotype imputation. |
| palindromic SNP | 回文 SNP | — | An A/T or C/G SNP whose strand orientation may be ambiguous. |
| ambiguous strand orientation | 链方向不明确 | — | A possible exclusion reason during data harmonization. |
| strand alignment | 统一链方向 | — | A preprocessing step during allele harmonization. |
| continuous trait | 连续性状 | — | A trait with continuous values; not a binary outcome. |
| quantitative trait | 定量性状 | — | A measurable quantitative trait; related to, but not identical with, continuous trait. |
| binary outcome | 二分类结局 | — | Use 二分类结局 consistently in Chinese. |
| survival outcome | 生存结局 | — | Use 生存结局 consistently in Chinese. |
| nonlinear causal relationship | 非线性因果关系 | — | A statement about a relationship, not automatically a particular causal-effect parameter. |
| multivariable MR | 多变量 MR | — | Use 多变量 MR consistently in Chinese. |
| parent-offspring trio | 父母—子代三联体 | 三联体, trio | A father, mother and offspring; preserve the Chinese form 父母—子代三联体. |
| within-sibship GWAS | 同胞内 GWAS | — | Emphasizes comparisons within sibling groups. |
| random genetic transmission within families | 家系内随机遗传传递 | — | Describes inheritance within a family, rather than environmental allocation. |
| between-family environmental differences | 家系间环境差异 | — | Distinguish them from random genetic transmission within a family. |
| shared family environment | 共享家庭环境 | — | Use 共享家庭环境 consistently in Chinese. |
| non-transmitted allele | 未传递等位基因 | — | An allele, not an entire non-transmitted gene. |
| parent-offspring genotype correlation | 亲子基因型相关性 | — | Correlation between parental and offspring genotypes. |
| family-level confounding | 家系层面混杂 | — | Use 家系层面混杂 consistently in Chinese. |
| parental effect | 父母效应 | — | An umbrella description; specify paternal or maternal IGE when the source is known. |
| paternal IGE | 父源 IGE | — | Effect origins; not the father's or mother's observed genotype. |
| maternal IGE | 母源 IGE | — | Effect origins; not the father's or mother's observed genotype. |
| unified estimator | 统一估计量 | — | Combines individuals with and without information on relatives under the source's design. |
| robust estimator | 稳健估计量 | — | Uses random genetic transmission within families to reduce sensitivity to population stratification under the source's assumptions. |
| one-sample MR using summary statistics | 单样本汇总统计量 MR | — | The source's design for its real-data analysis. |
| two-sample MR | 双样本 MR | — | Exposure and outcome summary statistics come from different or independent samples; describe overlap explicitly if present. |
| sample overlap | 样本重叠 | — | Use 样本重叠 consistently in Chinese. |
| negative-control design | 负对照设计 | — | Use 负对照设计 under this project's convention. |
| semi-simulated data | 半模拟数据 | — | Simulated data constructed using real data as a basis. |
| UK Biobank | 英国生物样本库 | UKB | Define UKB at first use; Chinese first use may include both 英国生物样本库 and UK Biobank. |
| White British ancestry | 白人英国祖源 | — | The source's description of ancestry in its data; do not generalize it to other samples. |
| ancestry heterogeneity | 祖源异质性 | — | Differences in genetic background across ancestry groups. |
| admixed ancestry | 混合祖源 | — | Describes ancestry composition, rather than the process of admixture. |
| ancestry admixture | 祖源混合 | — | Describes the process; not interchangeable with admixed ancestry in every sentence. |
| Social Science Genetic Association Consortium | Social Science Genetic Association Consortium | — | Preserve the institution's proper name; do not introduce an additional abbreviation here. |
| transcriptome-wide association study | 全转录组关联研究 | — | Use 全转录组关联研究 as the fixed Chinese term. |
| proteomic MR | 蛋白质组 MR | — | Use 蛋白质组 MR consistently in Chinese. |
| metabolomic MR | 代谢组 MR | — | Use 代谢组 MR consistently in Chinese. |
| rejection rate | 拒绝率 | — | The proportion of simulation replicates rejecting the null; it estimates type I error rate under the null and power under the alternative. |
| covariance matrix | 协方差矩阵 | — | Preserve the name appropriate to the mathematical object; do not mechanically replace every matrix name with variance-covariance matrix. |
| cross-covariance matrix | 交叉协方差矩阵 | — | A matrix of cross-covariances; distinct from a generic variance-covariance matrix. |
| joint covariance matrix | 联合协方差矩阵 | — | A covariance matrix for a joint vector; retain the object-specific name. |
| combined covariance matrix | 组合协方差矩阵 | — | The source-specific combined matrix; retain its mathematical definition. |
| effect estimation | 效应估计 | — | The act or process of estimation; not an estimator or a realized estimate. |
| Hardy-Weinberg equilibrium | 哈代-温伯格平衡 | — | A population equilibrium state; distinguish it from the law or the generating mechanism. |

## Contextual distinctions inherited from the source

| Terms or forms | Treatment |
|---|---|
| InSIDE assumption | Use 工具强度独立于直接效应假设 in Chinese; avoid the longer competing Chinese form. |
| Offspring | Use 子代 in Chinese prose. 后代 or 孩子 in comments and image paths are source-cleanup items, not rendered manuscript findings. |
| Parents and parental generation | Prefer 父母 collectively; retain 父母代 when generation is the subject. Preserve fixed names containing 亲代. |
| NTC and average parental effect | Unify only when both refer to the same NTC quantity; a generic parental effect is not automatically NTC. |
| Mendel's laws of inheritance | Use 孟德尔遗传定律 consistently in Chinese. |
| Hardy-Weinberg law and equilibrium | The law describes the mechanism here; equilibrium can describe a population state. |
| Population-based and traditional GWAS | Use the former for the source's population comparison; retain the latter for a historical or baseline method context. |
| LD pruning | Define LD first and retain the procedure's name; do not substitute a different variant-selection procedure. |
| Genotype imputation | Use 基因型插补 in Chinese. |
| Horizontal pleiotropy | Retain horizontal in balanced, correlated and uncorrelated subtypes. The source's exclusion of 方向性水平多效性 is a local naming choice. |
| Father's/mother's genotype and paternal/maternal effects | Actual parental genotypes and the origin of effects are distinct descriptions. |
| IGE and genetic nurture | Genetic nurture is one manifestation of parental IGE, not an interchangeable name for every IGE. |
| FGWAS-MR and family-based MR | FGWAS-MR is the formal project label; generic descriptions require contextual judgment. |
| Simulation study and Monte Carlo simulation | The first describes design or overall evaluation; the second names a random simulation procedure. |
| Empirical analysis and real-data analysis | The Chinese source uses 实例分析 for section names and 真实数据分析 for procedures and results in prose. |
| Variance-covariance and specialized covariance matrices | Preserve names for sampling, cross-, joint and combined matrices when they identify different objects. |
| Effect estimator, effect estimate and effect estimation | A statistical rule, its realized numerical value and the process are distinct. |
| Confounder and confounding bias | A variable and the resulting bias are distinct. |
| Type I error rate, power and rejection rate | Rejection rate estimates type I error rate under the null and power under the alternative. |

## Method labels and statistical notation

Use standard error (SE) after its first-use definition, separately in each writing domain. The Chinese source allows SE in prose, formulas and tables. Chinese prose uses P值; the English profile uses P value, subject to the target journal's typography.

Introduce the inverse-variance weighted method (IVW), then explicitly define MR-IVW as the comparison label. Use MR-IVW thereafter for that method; its family-based version is MR-IVW-F. This conditional sequence cannot be enforced by the glossary schema alone.

Preserve method-name capitalization and hyphens: MR-Egger, MR-Lasso, MRcML and cisMR-cML. Do not replace specialized covariance matrices, standard deviations, variances or standard errors with one another.

## Verification references for English method names

The source's Chinese label 因果异常评分估计方法 is mapped from its cited method to [causal analysis using summary effect estimates](https://mrcieu.r-universe.dev/cause/cause.pdf). The source expansion for MRMix is preserved; its published description is [Mendelian randomization analysis using mixture models](https://www.nature.com/articles/s41467-019-09432-2). These checks concern method naming and do not validate the source manuscript's account of the algorithms.
