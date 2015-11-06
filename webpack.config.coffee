
fs = require 'fs'
webpack = require 'webpack'

nodeModules = {}
fs.readdirSync('node_modules')
.filter (x) ->
  ['.bin'].indexOf(x) is -1
.forEach (mod) ->
  nodeModules[mod] = "commonjs #{mod}"

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
  externals: nodeModules
