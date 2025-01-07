/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
  env: {
    NEXT_PUBLIC_FUNCTION_URL: `https://${process.env.FUNCTION_APP_NAME}.azurewebsites.net`,
    NEXT_PUBLIC_STATIC_WEB_APP_URL: process.env.STATIC_WEB_APP_URL,
  },
  images: {
    domains: [
      'arialmed-functions-biokowps.azurewebsites.net',
      'cloud.appwrite.io'
    ],
  }
}

module.exports = nextConfig
