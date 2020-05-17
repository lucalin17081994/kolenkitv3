const { environment } = require('@rails/webpacker')

 
 
const webpack = require('webpack')
environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    "window.jQuery": "jquery" // < I think this could be the line you need.
  })
)
const aliasConfig = {
  'jquery': 'jquery-ui-dist/external/jquery/jquery.js',
  'jquery-ui': 'jquery-ui-dist/jquery-ui.js'
};

environment.config.set('resolve.alias', aliasConfig);
 
module.exports = environment
