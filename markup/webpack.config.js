const path = require('path');
const fs = require('fs');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const CopyPlugin = require("copy-webpack-plugin");

const PATHS = {
    src: path.join(__dirname, './src'),
    // src: path.join(__dirname, '../markup/src/frontend'),
    build: path.join(__dirname, './build')
};
const PAGES_DIR = `${PATHS.src}/pug`;
const PAGES = fs.readdirSync(PAGES_DIR).filter(filename => filename.endsWith('.pug'));

module.exports = {
    mode: 'development',
    entry: [
        `${PATHS.src}/js/core.js`,
        `${PATHS.src}/style/scss/style.scss`,
    ],
    devtool: 'source-map',
    devServer: {
        historyApiFallback: true,
        contentBase: path.resolve(__dirname, './build'),
        open: true,
        compress: true,
        host: '0.0.0.0',
        hot: true,
        port: 27000,
    },
    output: {
        path: `${PATHS.build}`,
        filename: 'js/bundle.js',
    },
    plugins: [
        new CopyPlugin({
            patterns: [
                {from: `${PATHS.src}/images`, to: `${PATHS.build}/assets/images`},
                {from: `${PATHS.src}/fonts`, to: `${PATHS.build}/assets/fonts`},
                // {from: "other", to: "public"},
            ],
        }),
        new MiniCssExtractPlugin({
            chunkFilename: "css/chunks/[id].css",
            filename: "css/[name].css",
        }),
        ...PAGES.map(page => new HtmlWebpackPlugin({
            inject: 'body',
            template: `${PAGES_DIR}/${page}`,
            filename: `./${page.replace(/\.pug/, '.html')}`
        }))
    ],
    module: {
        rules: [
            {
                test: /\.pug$/i,
                use: ['pug-loader'],
            },
            {
                test: /\.css$/i,
                use: [MiniCssExtractPlugin.loader, 'css-loader?url=false'],
            },
            {
                test: /\.scss$/i,
                use: [MiniCssExtractPlugin.loader, 'css-loader?url=false', 'sass-loader'],
            },
            {
                test: /\.m?js$/,
                exclude: /(node_modules|bower_components)/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ['@babel/preset-env']
                    }
                }
            }
        ]
    }
};