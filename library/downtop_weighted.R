#用于实现子节点间的权值加权
DownTopWeighted<-function (go.for.level,go.leaf.nodes,nodes.to.index,nodes.to.children,prob.for.genes,f.values)
{
  downtop.prob=prob.for.genes
  parent.weight=0.5
  for(k in 1:nrow(prob.for.genes))
  {
    for (i in length(go.for.level):1)
    {
      if(i<length(go.for.level))
      {
        for(j in 1:length(go.for.level[[i]]))
        {
          is.leafnode=go.for.level.3[[i]][[j]] %in% go.leaf.nodes
          if(is.leafnode==FALSE)
          {
            gene.name=go.for.level[[i]][[j]]
            gene.index=nodes.to.index[[(go.for.level[[i]])[j]]]
            pos.index=2*gene.index-1
            neg.index=2*gene.index
            inter.pos.prob=0
            children.index=nodes.to.children[[gene.name]]
            children.pos.num=0
            children.pos.index=list()
            child.total.w=0
            performance.w=0
            for(m in 1:length(children.index))
            {
              
              if(downtop.prob[k,(2*(children.index[[m]])-1)]>0.5)
              {
                
                children.pos.num=children.pos.num+1
                children.pos.index[[children.pos.num]]=children.index[[m]]
                child.total.w=child.total.w+f.values[children.index[[m]]]
              }
            }
            parent.weight=(length(go.for.level)+1-i)/(length(go.for.level)+1)
            if(children.pos.num>0)
            {
              if(i==length(go.for.level)-1)
              {
                for(n in 1:children.pos.num)
                {
                  performance.w=f.values[children.pos.index[[n]]]/child.total.w
                  inter.pos.prob=inter.pos.prob+downtop.prob[k,(2*(children.pos.index[[n]])-1)]*performance.w
                }
                downtop.prob[k,pos.index]=parent.weight*prob.for.genes[k,pos.index]+(1-parent.weight)*inter.pos.prob
              }
              else
              {
                for(n in 1:children.pos.num)
                {
                  inter.pos.prob=inter.pos.prob+downtop.prob[k,(2*(children.pos.index[[n]])-1)]
                }
                downtop.prob[k,pos.index]=parent.weight*prob.for.genes[k,pos.index]+(1-parent.weight)*inter.pos.prob/(children.pos.num)
              }
              
              
              downtop.prob[k,neg.index]=1-downtop.prob[k,pos.index]
            }
            
            if(downtop.prob[k,pos.index]>1)
            {
              downtop.prob[k,pos.index]=1
              downtop.prob[k,neg.index]=1-downtop.prob[k,pos.index]
            }
            
          }
        }
      }
    }
  }
  return(downtop.prob)
}