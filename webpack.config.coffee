
webpack = require 'webpack'

module.exports =
  entry: [
    'webpack/hot/poll?1000'
    './src/main'
  ]
  target: 'node'
  output:
    path: 'build/'
    filename: 'bundle.js'
  module:
    loaders: [
      {test: /\.coffee/, loader: 'coffee'}
    ]
  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ]
  resolve:
    extensions: ['.js', '', '.coffee']
