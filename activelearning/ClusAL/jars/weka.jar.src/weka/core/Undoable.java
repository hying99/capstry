package weka.core;

public interface Undoable {
  boolean isUndoEnabled();
  
  void setUndoEnabled(boolean paramBoolean);
  
  void clearUndo();
  
  boolean canUndo();
  
  void undo();
  
  void addUndoPoint();
}


/* Location:              C:\Users\1231\Desktop\dataprocessing\activelearning\Clus-AL\Clus-AL\ClusAL\!\jars\weka.jar!\weka\core\Undoable.class
 * Java compiler version: 2 (46.0)
 * JD-Core Version:       1.1.3
 */