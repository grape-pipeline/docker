#!/usr/bin/env python
"""Remove repository from Docker hub.

Usage:
    {0} <namespace> <repo>...

"""
import requests
import json
import sys
from docopt import docopt

cmd = sys.argv[0].replace("./", "").replace(".py","")

if __name__ == "__main__":
    arguments = docopt(__doc__.format(cmd), version="{0} v0.1".format(cmd))

    # read args
    namespace = sys.argv[1]
    repos = sys.argv[2:]
    
    # load docker user configuration
    cfg = json.load(open('/home/epalumbo/.dockercfg'))
    
    # set up request header
    header = {}
    header['Accept'] = 'application/json'
    header['Content-Type'] = 'application/json'
    header['Authorization'] = 'Basic {auth}'.format(**cfg.values()[0])
    header['Content-Type'] = 'application/json'
    header['X-Docker-Token'] = 'true'
    
    #do the job
    for repo in repos:
    
        url = "{0}repositories/{1}/{2}/".format(cfg.keys()[0], namespace, repo)
       
        print "=== Deleting {0}/{1}".format(namespace, repo)
        r = requests.delete(url, headers=header)
        print "Response: {0}".format(r)
