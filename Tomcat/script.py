import pickle
from Marker import Marker
with open("SESSIONS.ser","wb") as f:
    pickle.dump(Marker(), f)
