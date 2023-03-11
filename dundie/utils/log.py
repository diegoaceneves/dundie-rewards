import logging
import os
from logging import handlers

LOG_LEVEL = os.getenv("LOG_LEVEL", "WARNING").upper()
log = logging.Logger("dundie", LOG_LEVEL)


def get_logger(logfile="dundie.log"):
    """Returns a configured log"""
    fh = handlers.RotatingFileHandler(
        "meulog.log",
        maxBytes=300,
        backupCount=10,
    )
    fh.setLevel(LOG_LEVEL)
    fmt = logging.Formatter(
        "%(asctime)s %(name)s %(levelname)s "
        "l:%(lineno)d f:%(filename)s: %(message)s"
    )

    fh.setFormatter(fmt)
    log.addHandler(fh)
    return log
