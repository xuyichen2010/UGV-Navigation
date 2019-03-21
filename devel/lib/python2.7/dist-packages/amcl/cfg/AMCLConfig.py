## *********************************************************
##
## File autogenerated for the amcl package
## by the dynamic_reconfigure package.
## Please do not edit.
##
## ********************************************************/

from dynamic_reconfigure.encoding import extract_params

inf = float('inf')

config_description = {'upper': 'DEFAULT', 'lower': 'groups', 'srcline': 245, 'name': 'Default', 'parent': 0, 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'cstate': 'true', 'parentname': 'Default', 'class': 'DEFAULT', 'field': 'default', 'state': True, 'parentclass': '', 'groups': [], 'parameters': [{'srcline': 292, 'description': 'Minimum allowed number of particles.', 'max': 1000, 'cconsttype': 'const int', 'ctype': 'int', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'min_particles', 'edit_method': '', 'default': 100, 'level': 0, 'min': 0, 'type': 'int'}, {'srcline': 292, 'description': 'Mamimum allowed number of particles.', 'max': 10000, 'cconsttype': 'const int', 'ctype': 'int', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'max_particles', 'edit_method': '', 'default': 5000, 'level': 0, 'min': 0, 'type': 'int'}, {'srcline': 292, 'description': 'Maximum error between the true distribution and the estimated distribution.', 'max': 1.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'kld_err', 'edit_method': '', 'default': 0.01, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Upper standard normal quantile for (1 - p), where p is the probability that the error on the estimated distrubition will be less than kld_err.', 'max': 1.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'kld_z', 'edit_method': '', 'default': 0.99, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Translational movement required before performing a filter update.', 'max': 5.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'update_min_d', 'edit_method': '', 'default': 0.2, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Rotational movement required before performing a filter update.', 'max': 6.283185307179586, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'update_min_a', 'edit_method': '', 'default': 0.5235987755982988, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Number of filter updates required before resampling.', 'max': 20, 'cconsttype': 'const int', 'ctype': 'int', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'resample_interval', 'edit_method': '', 'default': 2, 'level': 0, 'min': 0, 'type': 'int'}, {'srcline': 292, 'description': 'Time with which to post-date the transform that is published, to indicate that this transform is valid into the future.', 'max': 2.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'transform_tolerance', 'edit_method': '', 'default': 0.1, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Exponential decay rate for the slow average weight filter, used in deciding when to recover by adding random poses. A good value might be 0.001.', 'max': 0.5, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'recovery_alpha_slow', 'edit_method': '', 'default': 0.0, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Exponential decay rate for the fast average weight filter, used in deciding when to recover by adding random poses. A good value might be 0.1.', 'max': 1.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'recovery_alpha_fast', 'edit_method': '', 'default': 0.0, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'When true skips laser scans when a scan doesnt work for a majority of particles', 'max': True, 'cconsttype': 'const bool', 'ctype': 'bool', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'do_beamskip', 'edit_method': '', 'default': False, 'level': 0, 'min': False, 'type': 'bool'}, {'srcline': 292, 'description': 'Distance from a valid map point before scan is considered invalid', 'max': 2.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'beam_skip_distance', 'edit_method': '', 'default': 0.5, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Ratio of samples for which the scans are valid to consider as valid scan', 'max': 1.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'beam_skip_threshold', 'edit_method': '', 'default': 0.3, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'When true (the default), publish results via TF.  When false, do not.', 'max': True, 'cconsttype': 'const bool', 'ctype': 'bool', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'tf_broadcast', 'edit_method': '', 'default': True, 'level': 0, 'min': False, 'type': 'bool'}, {'srcline': 292, 'description': 'Maximum rate (Hz) at which scans and paths are published for visualization, -1.0 to disable.', 'max': 100.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'gui_publish_rate', 'edit_method': '', 'default': -1.0, 'level': 0, 'min': -1.0, 'type': 'double'}, {'srcline': 292, 'description': 'Maximum rate (Hz) at which to store the last estimated pose and covariance to the parameter server, in the variables ~initial_pose_* and ~initial_cov_*. This saved pose will be used on subsequent runs to initialize the filter. -1.0 to disable.', 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'save_pose_rate', 'edit_method': '', 'default': 0.5, 'level': 0, 'min': -1.0, 'type': 'double'}, {'srcline': 292, 'description': 'When set to true, AMCL will subscribe to the map topic rather than making a service call to receive its map.', 'max': True, 'cconsttype': 'const bool', 'ctype': 'bool', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'use_map_topic', 'edit_method': '', 'default': False, 'level': 0, 'min': False, 'type': 'bool'}, {'srcline': 292, 'description': 'When set to true, AMCL will only use the first map it subscribes to, rather than updating each time a new one is received.', 'max': True, 'cconsttype': 'const bool', 'ctype': 'bool', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'first_map_only', 'edit_method': '', 'default': False, 'level': 0, 'min': False, 'type': 'bool'}, {'srcline': 292, 'description': "Minimum scan range to be considered; -1.0 will cause the laser's reported minimum range to be used.", 'max': 1000.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'laser_min_range', 'edit_method': '', 'default': -1.0, 'level': 0, 'min': -1.0, 'type': 'double'}, {'srcline': 292, 'description': "Maximum scan range to be considered; -1.0 will cause the laser's reported maximum range to be used.", 'max': 1000.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'laser_max_range', 'edit_method': '', 'default': -1.0, 'level': 0, 'min': -1.0, 'type': 'double'}, {'srcline': 292, 'description': 'How many evenly-spaced beams in each scan to be used when updating the filter.', 'max': 250, 'cconsttype': 'const int', 'ctype': 'int', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'laser_max_beams', 'edit_method': '', 'default': 30, 'level': 0, 'min': 0, 'type': 'int'}, {'srcline': 292, 'description': 'Mixture weight for the z_hit part of the model.', 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'laser_z_hit', 'edit_method': '', 'default': 0.95, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Mixture weight for the z_short part of the model.', 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'laser_z_short', 'edit_method': '', 'default': 0.1, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Mixture weight for the z_max part of the model.', 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'laser_z_max', 'edit_method': '', 'default': 0.05, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Mixture weight for the z_rand part of the model.', 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'laser_z_rand', 'edit_method': '', 'default': 0.05, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Standard deviation for Gaussian model used in z_hit part of the model.', 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'laser_sigma_hit', 'edit_method': '', 'default': 0.2, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Exponential decay parameter for z_short part of model.', 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'laser_lambda_short', 'edit_method': '', 'default': 0.1, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Maximum distance to do obstacle inflation on map, for use in likelihood_field model.', 'max': 20.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'laser_likelihood_max_dist', 'edit_method': '', 'default': 2.0, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Which model to use, either beam, likelihood_field or likelihood_field_prob.', 'max': '', 'cconsttype': 'const char * const', 'ctype': 'std::string', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'laser_model_type', 'edit_method': "{'enum_description': 'Laser Models', 'enum': [{'srcline': 52, 'description': 'Use beam laser model', 'srcfile': '/home/nuccar/roscar_2018/src/roscar/navigation/amcl/cfg/AMCL.cfg', 'cconsttype': 'const char * const', 'value': 'beam', 'ctype': 'std::string', 'type': 'str', 'name': 'beam_const'}, {'srcline': 52, 'description': 'Use likelihood_field laser model', 'srcfile': '/home/nuccar/roscar_2018/src/roscar/navigation/amcl/cfg/AMCL.cfg', 'cconsttype': 'const char * const', 'value': 'likelihood_field', 'ctype': 'std::string', 'type': 'str', 'name': 'likelihood_field_const'}, {'srcline': 52, 'description': 'Use likelihood_field_prob laser model', 'srcfile': '/home/nuccar/roscar_2018/src/roscar/navigation/amcl/cfg/AMCL.cfg', 'cconsttype': 'const char * const', 'value': 'likelihood_field_prob', 'ctype': 'std::string', 'type': 'str', 'name': 'likelihood_field_prob'}]}", 'default': 'likelihood_field', 'level': 0, 'min': '', 'type': 'str'}, {'srcline': 292, 'description': 'Which model to use, diff, omni, diff-corrected, or omni-corrected', 'max': '', 'cconsttype': 'const char * const', 'ctype': 'std::string', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'odom_model_type', 'edit_method': "{'enum_description': 'Odom Models', 'enum': [{'srcline': 56, 'description': 'Use diff odom model', 'srcfile': '/home/nuccar/roscar_2018/src/roscar/navigation/amcl/cfg/AMCL.cfg', 'cconsttype': 'const char * const', 'value': 'diff', 'ctype': 'std::string', 'type': 'str', 'name': 'diff_const'}, {'srcline': 57, 'description': 'Use omni odom model', 'srcfile': '/home/nuccar/roscar_2018/src/roscar/navigation/amcl/cfg/AMCL.cfg', 'cconsttype': 'const char * const', 'value': 'omni', 'ctype': 'std::string', 'type': 'str', 'name': 'omni_const'}, {'srcline': 58, 'description': 'Use corrected diff odom model', 'srcfile': '/home/nuccar/roscar_2018/src/roscar/navigation/amcl/cfg/AMCL.cfg', 'cconsttype': 'const char * const', 'value': 'diff-corrected', 'ctype': 'std::string', 'type': 'str', 'name': 'diff_corrected_const'}, {'srcline': 59, 'description': 'Use corrected omni odom model', 'srcfile': '/home/nuccar/roscar_2018/src/roscar/navigation/amcl/cfg/AMCL.cfg', 'cconsttype': 'const char * const', 'value': 'omni-corrected', 'ctype': 'std::string', 'type': 'str', 'name': 'omni_corrected_const'}]}", 'default': 'diff', 'level': 0, 'min': '', 'type': 'str'}, {'srcline': 292, 'description': "Specifies the expected noise in odometry's rotation estimate from the rotational component of the robot's motion.", 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'odom_alpha1', 'edit_method': '', 'default': 0.2, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': "Specifies the expected noise in odometry's rotation estimate from the translational component of the robot's motion.", 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'odom_alpha2', 'edit_method': '', 'default': 0.2, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': "Specifies the expected noise in odometry's translation estimate from the translational component of the robot's motion.", 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'odom_alpha3', 'edit_method': '', 'default': 0.2, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': "Specifies the expected noise in odometry's translation  estimate from the rotational component of the robot's motion.", 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'odom_alpha4', 'edit_method': '', 'default': 0.2, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Translation-related noise parameter (only used if model is omni).', 'max': 10.0, 'cconsttype': 'const double', 'ctype': 'double', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'odom_alpha5', 'edit_method': '', 'default': 0.2, 'level': 0, 'min': 0.0, 'type': 'double'}, {'srcline': 292, 'description': 'Which frame to use for odometry.', 'max': '', 'cconsttype': 'const char * const', 'ctype': 'std::string', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'odom_frame_id', 'edit_method': '', 'default': 'odom', 'level': 0, 'min': '', 'type': 'str'}, {'srcline': 292, 'description': 'Which frame to use for the robot base.', 'max': '', 'cconsttype': 'const char * const', 'ctype': 'std::string', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'base_frame_id', 'edit_method': '', 'default': 'base_link', 'level': 0, 'min': '', 'type': 'str'}, {'srcline': 292, 'description': 'The name of the coordinate frame published by the localization system.', 'max': '', 'cconsttype': 'const char * const', 'ctype': 'std::string', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'global_frame_id', 'edit_method': '', 'default': 'map', 'level': 0, 'min': '', 'type': 'str'}, {'srcline': 292, 'description': 'Retsore the default configuration', 'max': True, 'cconsttype': 'const bool', 'ctype': 'bool', 'srcfile': '/opt/ros/kinetic/lib/python2.7/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'name': 'restore_defaults', 'edit_method': '', 'default': False, 'level': 0, 'min': False, 'type': 'bool'}], 'type': '', 'id': 0}

min = {}
max = {}
defaults = {}
level = {}
type = {}
all_level = 0

#def extract_params(config):
#    params = []
#    params.extend(config['parameters'])
#    for group in config['groups']:
#        params.extend(extract_params(group))
#    return params

for param in extract_params(config_description):
    min[param['name']] = param['min']
    max[param['name']] = param['max']
    defaults[param['name']] = param['default']
    level[param['name']] = param['level']
    type[param['name']] = param['type']
    all_level = all_level | param['level']

AMCL_beam_const = 'beam'
AMCL_likelihood_field_const = 'likelihood_field'
AMCL_likelihood_field_prob = 'likelihood_field_prob'
AMCL_diff_const = 'diff'
AMCL_omni_const = 'omni'
AMCL_diff_corrected_const = 'diff-corrected'
AMCL_omni_corrected_const = 'omni-corrected'
