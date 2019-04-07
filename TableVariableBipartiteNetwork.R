library(readr)
library("dplyr", lib.loc="~/R/win-library/3.5")
rvam <- read_csv("rvam.csv")
#drop the variables shared by all reports
rvam_clean <- select(rvam, 1, 4:12, 14)
#create bipartite affiliation matrix
rvam_m <- as.matrix(rvam_clean[,-1], rownames.force = NA)
rownames <- rvam_clean$report_index
colnames <- colnames(rvam_clean[,-1])
dimnames(rvam_m) <- list(rownames, colnames)
#create the bipartite igraph graph object
rvam_m_graph <- graph.incidence(rvam_m)
#add $type to the vertice attributes
V(rvam_m_graph)$type <- bipartite_mapping(rvam_m_graph)$type
#define the vertice visualization criteria
V(rvam_m_graph)$color <- ifelse(V(rvam_m_graph)$type, "lightblue", "salmon")
V(rvam_m_graph)$shape <- ifelse(V(rvam_m_graph)$type, "circle", "square")
E(rvam_m_graph)$color <- "lightgray"
plot(rvam_m_graph, layout = layout.fruchterman.reingold.grid, vertex.size = 7, vertex.label.cex = 0.6)
#consolidate into a unipartite graph with just the variables, no reports
projected_rvam_m_graph <- bipartite_projection(rvam_m_graph, multiplicity = TRUE)
projected_rvam_m_graph
report_relations <- projected_rvam_m_graph$proj1
variable_relations <- projected_rvam_m_graph$proj2
plot(report_relations, layout = layout.fruchterman.reingold.grid)
plot(variable_relations, layout = layout.fruchterman.reingold.grid)
