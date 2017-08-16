function import_nfr_sql -d 'decompress and import sql file into nfr_dev'
  lz4 -d $argv | mysql -uroot nfr_dev
end
