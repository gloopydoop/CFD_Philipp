function [L,R] = shock_track(rho,eps)
  % Track shock:
 %  	Rho |
%       +---------
%       |         \
%       |          \
%       |           -------
%       +--------+--+-------+--> X
%      shock L-->|--|<--shock R

  % check that the gradient is steep
  