module.exports = (config, { strapi }) => {
  return async (ctx, next) => {
    if (ctx.request.url === '/_health' && ctx.request.method === 'GET') {
      ctx.status = 200;
      ctx.body = {
        status: 'ok',
        timestamp: new Date().toISOString(),
        uptime: process.uptime(),
        environment: process.env.NODE_ENV || 'development',
      };
      return;
    }
    await next();
  };
};
