
fs = require 'fs'
path = require 'path'
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
  mode: 'development'
  target: 'node'
  output:
    path: path.join __dirname, 'build/'
    filename: 'bundle.js'
  module:
    rules: [
      {test: /\.coffee/, loader: 'coffee-loader'}
    ]
  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ]
  resolve:
    extensions: ['.js', '.coffee']
  externals: nodeModules
