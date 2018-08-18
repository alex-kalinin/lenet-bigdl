#!/bin/bash

export SPARK_HOME=/usr/src/app/spark-2.2.0-bin-hadoop2.7
export ZOO_HOME=/usr/src/app/zoo/dist

# source activate py35

#  Check environment variables
if [ -z "${ZOO_HOME}" ]; then
    echo "Please set ZOO_HOME environment variable"
    exit 1
fi

if [ -z "${SPARK_HOME}" ]; then
    echo "Please set SPARK_HOME environment variable"
    exit 1
fi

# setup paths
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --notebook-dir=./ --ip=* --no-browser --allow-root --NotebookApp.token=''"
#export ZOO_JAR=`find ${ZOO_HOME}/zoo/target -type f -name "zoo*jar-with-dependencies.jar"`

#export ZOO_PY_ZIP=`find ${ZOO_HOME}/zoo/target -type f -name "zoo*python-api.zip"`
#export BIGDL_CONF=${ZOO_HOME}/backend/bigdl/spark/dl/src/main/resources/spark-bigdl.conf
#export PYTHONPATH=${PYTHONPATH}:${ZOO_PY_ZIP}:${ZOO_HOME}/backend/bigdl/pyspark

export ZOO_JAR_NAME=`ls ${ZOO_HOME}/lib/ | grep jar-with-dependencies.jar`
export ZOO_JAR="${ZOO_HOME}/lib/$ZOO_JAR_NAME"
export ZOO_PY_ZIP_NAME=`ls ${ZOO_HOME}/lib/ | grep python-api.zip`
export ZOO_PY_ZIP="${ZOO_HOME}/lib/$ZOO_PY_ZIP_NAME"
export ZOO_CONF=${ZOO_HOME}/conf/spark-bigdl.conf

export PYTHONPATH=${PYTHONPATH}:${ZOO_PY_ZIP}:${ZOO_HOME}/../backend/bigdl/pyspark

# Check files
if [ ! -f ${ZOO_CONF} ]; then
    echo "Cannot find ${BIGDL_CONF}"
    exit 1
fi

if [ ! -f ${ZOO_PY_ZIP} ]; then
    echo "Cannot find ${ZOO_PY_ZIP}"
    exit 1
fi

if [ ! -f ${ZOO_JAR} ]; then
    echo "Cannot find ${ZOO_JAR}"
    exit 1
fi

tensorboard --logdir=/tmp/bigdl_summaries/lenet5-  2>&1 >tensorboard.log &

${SPARK_HOME}/bin/pyspark --properties-file ${ZOO_CONF} --master=local[2] --driver-memory=2g --py-files ${ZOO_PY_ZIP} --jars ${ZOO_JAR} --conf spark.driver.extraClassPath=${ZOO_JAR} --conf spark.executor.extraClassPath=${ZOO_JAR} --conf spark.sql.catalogImplementation='in-memory' $*