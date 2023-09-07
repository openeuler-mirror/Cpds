__='
   Copyright 2023 CPDS Author
   
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
   
        https://www.apache.org/licenses/LICENSE-2.0
   
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
'

#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <start|stop>"
    exit 1
fi

case "$1" in
    "start")
        /bin/systemctl start nginx.service
        /bin/systemctl start cpds-analyzer.service
        ;;
    "restart")
        /bin/systemctl restart nginx.service
        /bin/systemctl restart cpds-analyzer.service
        /bin/systemctl restart cpds-detector.service
        /bin/systemctl restart prometheus.service
        ;;
    "stop")
        /bin/systemctl stop nginx.service
        /bin/systemctl stop cpds-analyzer.service
        /bin/systemctl stop cpds-detector.service
        /bin/systemctl stop prometheus.service
        ;;
    *)
        echo "Invalid argument: $1"
        echo "Usage: $0 <start|stop>"
        exit 1
        ;;
esac