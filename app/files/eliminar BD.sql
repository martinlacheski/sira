SELECT * FROM pg_stat_activity WHERE datname = 'sira';
SELECT	pg_terminate_backend (12787) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'sira';
DROP DATABASE sira;
