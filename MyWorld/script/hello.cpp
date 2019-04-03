#include <gazebo/gazebo.hh>

namespace gazebo
{
  class WorldPluginMyRobot : public WorldPlugin
  {
    public: WorldPluginMyRobot() : WorldPlugin()
    {
       
    }

    public: void Load(physics::WorldPtr _world, sdf::ElementPtr _sdf)
    {
       printf("Welcome to Alexey's World!\n");         
    }
  };
  GZ_REGISTER_WORLD_PLUGIN(WorldPluginMyRobot)
}
