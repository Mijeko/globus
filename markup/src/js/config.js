let url = location.protocol + '//' + location.hostname + '/';

if (location.hostname === "localhost" || location.hostname === "127.0.0.1") url = 'http://localhost:27016/';

const config = {
};


export default config;