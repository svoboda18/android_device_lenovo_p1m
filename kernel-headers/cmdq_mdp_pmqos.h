#ifndef __CMDQ_MDP_PMQOS_H__
#define __CMDQ_MDP_PMQOS_H__
struct mdp_pmqos {
	uint32_t isp_bandwidth;
	uint32_t isp_total_pixel;
	uint32_t mdp_bandwidth;
	uint32_t mdp_total_pixel;
	uint64_t tv_sec;
	uint64_t tv_usec;
};
#endif

