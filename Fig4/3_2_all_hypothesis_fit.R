## plot to show model fit with different hypothesis
traj_fit_arsv<-rbind(traj_fit_arsv_neutral,traj_fit_arsv_psi,traj_fit_arsv_chi,traj_fit_arsv_coinfect)

arsv_inc_data_fit<-inc_data_add%>%
  mutate(HHSregion=HHS_REGION)%>%
  #pivot_wider(names_from = virus, values_from = cases)%>%
  drop_na()%>%
  mutate(virus=case_when(
    virus=="RSV" ~ "RSV",
    virus=="fluA" ~ "FluA",
    virus=="fluB" ~ "FluB"
  ))%>%
  mutate(pathogen=factor(virus,levels=patho_order))%>%
  filter(pathogen!="FluB")


hypo_levels=c("No interaction","inhibition of co-infection","Cross-immunity","Inhibition of co-infetion and cross immunity")
patho_order<-c("RSV","FluA")
traj_fit_arsv%>%
  
  mutate(hypothesis=case_when(hypothesis=="neutral"~"No interaction",
                             hypothesis=="psi"~"inhibition of co-infection",
                             hypothesis=="chi"~"Cross-immunity",
                             hypothesis=="co_infect"~"Inhibition of co-infetion and cross immunity"))%>%
  mutate(hypothesis=factor(hypothesis,levels=hypo_levels))%>%
  mutate(pathogen=factor(type,levels=patho_order))%>%
  ggplot(aes(x=time+2011,y=cases))+
  geom_line(data=arsv_inc_data_fit,aes(x=date,y=cases))+
  geom_line(aes(color=hypothesis),size=0.3)+
  geom_ribbon(aes(ymin = cases_lb, ymax = cases_ub, fill = hypothesis),alpha=0.5)+
  facet_grid(HHSregion~pathogen+hypothesis,scales="free")+
  theme_bw()+
  theme(legend.position="bottom")+
  xlab("Time")+
  theme(text = element_text(size = 8))+
  scale_color_manual(name="",values = c("No interaction"="#7570B3","inhibition of co-infection"="#E7298A","Cross-immunity"="#66A61E",
                                        "Inhibition of co-infetion and cross immunity"="#E6AB02","Observed"="black"))+
  scale_fill_manual(name="",values = c("No interaction"="#7570B3","inhibition of co-infection"="#E7298A","Cross-immunity"="#66A61E",
                                       "Inhibition of co-infetion and cross immunity"="#E6AB02","Observed"="black"))+
  guides(fill = "none")+
  gg.theme +
  theme(
        legend.position = "top") +
  guides(linetype = guide_legend(ncol = 1, order = 1), 
         colour = guide_legend(ncol = 3)) +
  theme(legend.spacing.y = unit(0.1, "lines"),
        legend.key = element_blank(), 
        legend.background = element_blank() )->arsv_fit_hypo



arsv_inc_data_fit_repre<-arsv_inc_data_fit%>%filter(HHSregion==1)
traj_fit_arsv%>%
  
  mutate(hypothesis=case_when(hypothesis=="neutral"~"No interaction",
                              hypothesis=="psi"~"inhibition of co-infection",
                              hypothesis=="chi"~"Cross-immunity",
                              hypothesis=="co_infect"~"Inhibition of co-infetion and cross immunity"))%>%
  mutate(hypothesis=factor(hypothesis,levels=hypo_levels))%>%
  mutate(pathogen=factor(type,levels=patho_order))%>%
  filter(HHSregion==1)%>%
  ggplot(aes(x=time+2011,y=cases))+
  geom_line(data=arsv_inc_data_fit_repre,aes(x=date,y=cases))+
  geom_line(aes(color=hypothesis),size=0.2)+
  geom_ribbon(aes(ymin = cases_lb, ymax = cases_ub, fill = hypothesis),alpha=0.6)+
  facet_grid(hypothesis~pathogen,scales="free")+
  theme_bw()+
  theme(legend.position="bottom")+
  xlab("Time")+
  ylab("Reported cases")+
  theme(text = element_text(size = 7))+
  scale_color_manual(name="",values = c("No interaction"="#7570B3","inhibition of co-infection"="#E7298A","Cross-immunity"="#66A61E",
                                        "Inhibition of co-infetion and cross immunity"="#E6AB02","Observed"="black"))+
  scale_fill_manual(name="",values = c("No interaction"="#7570B3","inhibition of co-infection"="#E7298A","Cross-immunity"="#66A61E",
                                        "Inhibition of co-infetion and cross immunity"="#E6AB02","Observed"="black"))+
  guides(fill = "none")+
  gg.theme +
  theme(
        legend.position = "top") +
  guides(linetype = guide_legend(ncol = 1, order = 1), 
         colour = guide_legend(ncol = 3)) +
  theme(legend.spacing.y = unit(0.1, "lines"),
        legend.key = element_blank(), 
        legend.background = element_blank(),
        strip.text.y = element_blank(),
        plot.margin = margin(b=1,t = 1,l=1,r=1))+
  scale_x_continuous(breaks = seq(2014,2017,2))+
  scale_y_continuous(breaks = seq(0,800,400))->arsv_fit_hypo_repre














#####################################################################################################  

traj_fit_brsv<-rbind(traj_fit_brsv_neutral,traj_fit_brsv_psi,traj_fit_brsv_chi,traj_fit_brsv_coinfect)
traj_fit_brsv_coinfect%>%
  mutate(hypothesis="co_infect")

brsv_inc_data_fit<-inc_data_add%>%
  mutate(HHSregion=HHS_REGION)%>%
  #pivot_wider(names_from = virus, values_from = cases)%>%
  drop_na()%>%
  mutate(virus=case_when(
    virus=="RSV" ~ "RSV",
    virus=="fluA" ~ "FluA",
    virus=="fluB" ~ "FluB"
  ))%>%
  mutate(pathogen=factor(virus,levels=patho_order))%>%
  filter(pathogen!="FluA")


hypo_levels=c("No interaction","inhibition of co-infection","Cross-immunity","Inhibition of co-infetion and cross immunity")
patho_order<-c("RSV","FluB")
traj_fit_brsv%>%
  
  mutate(hypothesis=case_when(hypothesis=="neutral"~"No interaction",
                              hypothesis=="psi"~"inhibition of co-infection",
                              hypothesis=="chi"~"Cross-immunity",
                              hypothesis=="co_infect"~"Inhibition of co-infetion and cross immunity"))%>%
  mutate(hypothesis=factor(hypothesis,levels=hypo_levels))%>%
  mutate(pathogen=factor(type,levels=patho_order))%>%
  ggplot(aes(x=time+2011,y=cases))+
  geom_line(data=brsv_inc_data_fit,aes(x=date,y=cases))+
  geom_line(aes(color=hypothesis),size=0.5)+
  geom_ribbon(aes(ymin = cases_lb, ymax = cases_ub, fill = hypothesis),alpha=0.5)+
  facet_grid(HHSregion~pathogen+hypothesis,scales="free")+
  theme_bw()+
  theme(legend.position="bottom")+
  xlab("Time")+
  theme(text = element_text(size = 8))+
  scale_color_manual(name="",values = c("No interaction"="#7570B3","inhibition of co-infection"="#E7298A","Cross-immunity"="#66A61E",
                                        "Inhibition of co-infetion and cross immunity"="#E6AB02","Observed"="black"))+
  scale_fill_manual(name="",values = c("No interaction"="#7570B3","inhibition of co-infection"="#E7298A","Cross-immunity"="#66A61E",
                                       "Inhibition of co-infetion and cross immunity"="#E6AB02","Observed"="black"))+
  guides(fill = "none")+
  gg.theme +
  theme(
        legend.position = "top") +
  guides(linetype = guide_legend(ncol = 1, order = 1), 
         colour = guide_legend(ncol = 3)) +
  theme(legend.spacing.y = unit(0.1, "lines"),
        legend.key = element_blank(), 
        legend.background = element_blank() )->brsv_fit_hypo



brsv_inc_data_fit_repre<-brsv_inc_data_fit%>%filter(HHSregion==1)
traj_fit_brsv%>%
  
  mutate(hypothesis=case_when(hypothesis=="neutral"~"No interaction",
                              hypothesis=="psi"~"inhibition of co-infection",
                              hypothesis=="chi"~"Cross-immunity",
                              hypothesis=="co_infect"~"Inhibition of co-infetion and cross immunity"))%>%
  mutate(hypothesis=factor(hypothesis,levels=hypo_levels))%>%
  mutate(pathogen=factor(type,levels=patho_order))%>%
  filter(HHSregion==1)%>%
  ggplot(aes(x=time+2011,y=cases))+
  geom_line(data=brsv_inc_data_fit_repre,aes(x=date,y=cases))+
  geom_line(aes(color=hypothesis),size=0.2)+
  geom_ribbon(aes(ymin = cases_lb, ymax = cases_ub, fill = hypothesis),alpha=0.5)+
  facet_grid(hypothesis~pathogen,scales="free")+
  theme_bw()+
  theme(legend.position="bottom")+
  xlab("Time")+
  ylab("Cases")+
  theme(text = element_text(size = 7))+
  scale_color_manual(name="",values = c("No interaction"="#7570B3","inhibition of co-infection"="#E7298A","Cross-immunity"="#66A61E",
                                        "Inhibition of co-infetion and cross immunity"="#E6AB02","Observed"="black"))+
  scale_fill_manual(name="",values = c("No interaction"="#7570B3","inhibition of co-infection"="#E7298A","Cross-immunity"="#66A61E",
                                       "Inhibition of co-infetion and cross immunity"="#E6AB02","Observed"="black"))+
  guides(fill = "none")+
  gg.theme +
  theme(
        legend.position = "top") +
  guides(linetype = guide_legend(ncol = 1, order = 1), 
         colour = guide_legend(ncol = 3)) +
  theme(legend.spacing.y = unit(0.1, "lines"),
        legend.key = element_blank(), 
        legend.background = element_blank(),
        strip.text.y = element_blank(),
        plot.margin = margin(b=1,t = 1,l=1,r=1))+
  scale_x_continuous(breaks = seq(2014,2017,2))+
  scale_y_continuous(breaks = seq(0,125,50))->brsv_fit_hypo_repre


legend <- get_legend(
  brsv_fit_hypo_repre + 
    guides(color = guide_legend(nrow = 3)) +
    theme(legend.position = "top",
          text = element_text(size = 8))
)

plot_grid(arsv_fit_hypo_repre+theme(text = element_text(size = 8)), 
          brsv_fit_hypo_repre+ theme(legend.position="none",text = element_text(size = 8)), 
          nrow = 2,
          labels = "AUTO", label_size = 12)->fit_hypo_repre

plot_grid(legend,fit_hypo_repre,
          ncol=1,
          rel_heights = c(.15, 1))->p_fit_hypo_repre







