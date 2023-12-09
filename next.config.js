/** @type {import('next').NextConfig} */
const nextConfig = {
  env: {
        'MYSQL_HOST': '127.0.0.1',
        'MYSQL_PORT': '3306',
        'MYSQL_DATABASE': 'admin',
        'MYSQL_USER': 'root',
        'MYSQL_PASSWORD': '123456',
        'MY_API_KEY': 'Bearer AtNcesaNx5nkRKjUdwEI5MZM7XikjExB4twJoxJi'
    }
}

module.exports = nextConfig
