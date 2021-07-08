package weka.gui.beans;

import java.beans.BeanDescriptor;
import java.beans.PropertyDescriptor;

public class CrossValidationFoldMakerBeanInfo extends AbstractTrainAndTestSetProducerBeanInfo {
  public PropertyDescriptor[] getPropertyDescriptors() {
    try {
      PropertyDescriptor propertyDescriptor1 = new PropertyDescriptor("folds", CrossValidationFoldMaker.class);
      PropertyDescriptor propertyDescriptor2 = new PropertyDescriptor("seed", CrossValidationFoldMaker.class);
      return new PropertyDescriptor[] { propertyDescriptor1, propertyDescriptor2 };
    } catch (Exception exception) {
      exception.printStackTrace();
      return null;
    } 
  }
  
  public BeanDescriptor getBeanDescriptor() {
    return new BeanDescriptor(CrossValidationFoldMaker.class, CrossValidationFoldMakerCustomizer.class);
  }
}


/* Location:              C:\Users\1231\Desktop\dataprocessing\activelearning\Clus-AL\Clus-AL\ClusAL\!\jars\weka.jar!\weka\gui\beans\CrossValidationFoldMakerBeanInfo.class
 * Java compiler version: 2 (46.0)
 * JD-Core Version:       1.1.3
 */